class RatingsController < ApplicationController

  def show
    @rating = Rating.find(params[:id])
  end

  def confirm_yes
    @rating = Rating.find(params[:id])
    @rating.update_attribute("confirmed", true)
    redirect_to workouts_path
  end

  def confirm_no
    @rating = Rating.find(params[:id])
    @rating.update_attribute("confirmed", false)
    @workout = Workout.find(@rating.workout)
    UserMailer.punishment(@workout, @rating.rated).deliver
    redirect_to workouts_path
  end

end
