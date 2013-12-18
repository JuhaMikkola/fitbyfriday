class HomeController < ApplicationController
  def index
    @user = User.new
    if current_user
      redirect_to workouts_path
    end
  end # GET /users/new

end