class RatingsController < ApplicationController

  def show
    @rating = Rating.find(params[:id])
  end

  def confirm
    @rating = Rating.find(params[:id])
    @rating.update_attribute("confirmed", params[:rating_confirmation])
    if params[:rating_confirmation] == "false"
      @workout = Workout.find(@rating.workout)
      UserMailer.punishment(@workout, @rating.rated).deliver
    end
    respond_to do |format|
        format.html { redirect_to workouts_path }
        format.json { head :no_content }
    end
  end

  def confirm_no
    @rating = Rating.find(params[:id])
    @rating.update_attribute("confirmed", false)
    @workout = Workout.find(@rating.workout)
    UserMailer.punishment(@workout, @rating.rated).deliver
    redirect_to workouts_path
  end

end
