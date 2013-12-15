class RatingsController < ApplicationController

  def show
    @rating = Rating.find(params[:id])    
  end

  def confirm_yes
    @rating = Rating.find(params[:id])
    @rating.update_attribute("confirmed", true)
    @rating.confirmed = "true"
    @rating.save
    redirect_to workouts_path
  end

  def confirm_no
    @rating = Rating.find(params[:id])
    @rating.update_attribute("confirmed", true)
    @rating.confirmed = "false"
    @rating.save
    redirect_to workouts_path
  end

end
