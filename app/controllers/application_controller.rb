class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def load_master
    Master.find_by(user_id: current_user.id)
  end
end
