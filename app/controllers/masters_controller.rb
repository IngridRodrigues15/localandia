class MastersController < ApplicationController

  def index
    @master = Master.find_by(user_id: current_user.id)
    @characters = Character.where(game_id: @master.game.id)
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
    else
      redirect_to masters_path
    end
  end

  def load_master
    Master.find_by(user_id: current_user.id)
  end

end
