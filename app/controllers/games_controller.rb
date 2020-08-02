class GamesController < ApplicationController
  def create
    @game = Game.new(game_params)
    @master = load_master
    if @game.save && link_game_to_master(@game)
      redirect_to masters_path
    else
      render 'new'
    end
  end

  def new
    @game = Game.new
  end

  private
  def link_game_to_master(game)
    master = load_master
    master.game = game
    master.save
  end

  def game_params
    params.require(:game).permit(:description)
  end
end
