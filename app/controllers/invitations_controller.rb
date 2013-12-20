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
    # current_user.workouts << @workout MOVED THIS DOWN AFTER RATINGS ARE CREATED
    @invitation.update_attribute("confirmed", true)
    # @partners = @workout.user_workouts.select { |u| u.user_id != current_user }
    # @partners.each do |p|
    @workout.user_workouts.each do |p|
      Rating.create(workout_id: p.workout_id, rater_id: current_user.id, rated_id: p.user_id)
      Rating.create(workout_id: p.workout_id, rater_id: p.user_id, rated_id: current_user.id)
    end
    current_user.workouts << @workout
    redirect_to workouts_path
  end

  def app_invite
    if @user = User.find_by_email(params[:email])
      redirect_to @user
    else
      UserMailer.app_invite(params[:email], current_user).deliver
      redirect_to workouts_path
    end
  end

  def decline
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    # Send email or text to sender to notify them that
    redirect_to workouts_path
  end

end
