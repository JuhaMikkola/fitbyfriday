class WorkoutsController < ApplicationController

  def index
    @user = current_user
    @workouts = @user.workouts.group_by { |w| w.start_time.to_date.beginning_of_week }
    @workouts = @workouts[DateTime.now.beginning_of_week.to_date]
    # @workouts = @workouts[DateTime.now.next_week.beginning_of_week.to_date]
    @workouts.sort!{|t1,t2|t1.start_time <=> t2.start_time}
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.creator = current_user
    if @workout.save
      redirect_to workouts_path
    else
      render 'new'
    end
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    if @workout.update_attributes
      redirect_to workout_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect_to workouts_path
  end

  private
  def workout_params
    params.require(:workout).permit(:activity, :start_time, :location, :creator_id)
  end

end