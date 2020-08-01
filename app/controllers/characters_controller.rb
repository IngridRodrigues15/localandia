class CharactersController < ApplicationController
  def index
    character = Character.find_by(user_id: current_user.id)
    define_path
  end

  def create
    byebug
    @character = Character.new(character_params)
    @character.user = current_user
    if @character.save
      define_path
    else
      render 'new'
    end
  end

  def new
    @character = Character.new
  end

  def define_game
    set_games
    @character = Character.find_by(user: current_user)
  end

  def update
    
    @character = Character.find_by(id: params[:id])
    game = Game.find(game_params[:game_id])
    if @character.update_attributes(game: game)
      define_path
    else
      render 'edit'
    end
  end

  private
  def set_games
     @games = Game.all #TO DO Mostrar so os do dia
  end

  def define_path
    @character = load_character
    if @character.nil?
      @character = Character.new
      render :new
    elsif @character.game.nil?
      set_games
      render :define_game_character
    else
      redirect_to new_sheet_path
    end
  end

  def character_params
    params.require(:character).permit(:nome)
  end

  def game_params
    params.require(:character).permit(:game_id)
  end

  def load_character
    Character.find_by(user_id: current_user.id)
  end
end
