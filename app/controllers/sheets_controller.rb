class SheetsController < ApplicationController

  def new
    define_path
  end

  def define_character_type
    @sheet = Sheet.new
    set_caracter_types
  end

  def create
    @sheet = Sheet.new(sheet_params)
    @sheet.rubies = 150

    if @sheet.save && link_sheet_to_caracter(@sheet) && initial_itens(@sheet)
      define_path
    else
      set_caracter_types
      render 'new'
    end
  end

  def show
    @character = load_character
    @sheet = Sheet.find_by(id: params[:id])
    @sheet_characteristics = @sheet.sheet_characteristics
  end

  def characteristics_form
    set_characteristic
    @character = load_character
    @sheet = @character.sheet
    @sheet_characteristic = @sheet.sheet_characteristics.new
  end

  def characteristics
    @sheet = Sheet.find_by(id: params[:id])
    characteristics = Characteristic.all
    characteristics.each do |characteristic|
      @sheet.sheet_characteristics.create(characteristic: characteristic, quantity: params[characteristic.name]["quantity"].to_i)
    end
    @sheet.define_player_life_points
    @sheet.define_player_mana_points
    redirect_to sheet_path(@sheet)
  end

  private

  def set_characteristic
    @characteristics = Characteristic.all
  end

  def define_path
    character = load_character
    @sheet = character.sheet
    if @sheet.nil?
      @sheet = Sheet.new
      set_caracter_types
      render 'define_character_type_sheet'
    elsif @sheet.sheet_characteristics.empty?
      redirect_to characteristics_form_sheet_path(@sheet.id)
    else
      redirect_to sheet_path(@sheet.id)
    end
  end

  def set_caracter_types
    @caracter_types = CharacterType.all
  end

  def link_sheet_to_caracter(sheet)
    character = load_character
    character.sheet = sheet
    character.save
  end

  def initial_itens(sheet)
    itens = Item.where(kind: "Inicial")
    itens.each do |item|
      sheet.inventories.create(item: item, quantity:1)
    end
  end

  def sheet_params
    params.require(:sheet).permit(:character_type_id)
  end
end
