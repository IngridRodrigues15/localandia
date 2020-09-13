class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:video]

  def index
    master = load_master
    if master.nil?
      redirect_to characters_path
    else
      redirect_to masters_path
    end
  end

  def video
  end
end
