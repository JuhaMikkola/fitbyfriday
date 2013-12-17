class InvitationsController < ApplicationController
  # create load workout before filter
  def index
  end

  def show
    @workout = Workout.find(params[:workout_id])
    @invitation = Invitation.find(params[:id])
    if (@invitation.sender != current_user) && (@invitation.target != current_user)
      redirect_to workouts_path
    end
  end

  def accept
    @invitation = Invitation.find(params[:id])
    @workout = Workout.find(params[:workout_id])
    current_user.workouts << @workout
    @invitation.update_attribute("confirmed", true)
    @partners = @workout.user_workouts.select { |u| u.user_id != current_user }
    @partners.each do |p|
      Rating.create(workout_id: p.workout_id, rater_id: current_user.id, rated_id: p.user_id)
      
      Rating.create(workout_id: p.workout_id, rater_id: p.user_id, rated_id: current_user.id)
    
    end


    redirect_to workouts_path
  end

  def decline
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    # Send email or text to sender to notify them that
    redirect_to workouts_path
  end
end
