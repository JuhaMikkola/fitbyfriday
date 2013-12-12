class InvitationsController < ApplicationController
  def index
  end

  def show
    @workout = Workout.find(params[:workout_id])
    @invitation = Invitation.find(params[:id])
  end

  def accept
    @invitation = Invitation.find(params[:id])
    @workout = Workout.find(params[:workout_id])
    current_user.workouts << @workout
    @invitation.confirmed = "true"
    @invitation.save
    redirect_to workouts_path
  end
end
