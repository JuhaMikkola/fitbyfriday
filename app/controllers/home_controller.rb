class HomeController < ApplicationController
  def index
    @ignore_header = true
    @user = User.new
    if current_user
      redirect_to workouts_path
    end
  end # GET /users/new

end