class HomeController < ApplicationController

  def index
    master = load_master
    if master.nil?
      redirect_to characters_path
    else
      redirect_to masters_path
    end
  end

end
