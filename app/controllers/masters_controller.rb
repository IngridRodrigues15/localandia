class MastersController < ApplicationController

  def index
    define_path
    @master = load_master
    @characters = Character.where(game_id: @master.try(:game).try(:id))
    @itens = Item.where.not(kind: "Inicial")
  end

  def create
    @master = Master.new(master_params)
    @master.user = current_user
    if @master.save
      define_path
    else
      render 'new'
    end
  end

  def new
    @master = Master.new
  end

  private

  def master_params
    params.require(:master).permit(:nome)
  end

  def define_path
    @master = load_master
    if @master.nil?
      @master = Master.new
      render :new
    elsif @master.game.nil?
      redirect_to new_game_path
    end
  end

end
