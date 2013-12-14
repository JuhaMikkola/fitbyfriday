class RatingsController < ApplicationController

  def show
    @rating = Rating.find(params[:id])    
  end

  def confirm
    @rating = Rating.find(params[:id])
    @rating.confirmed = "true"
    @rating.save
    redirect_to workouts_path
  end

end
