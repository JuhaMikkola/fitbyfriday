class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all.group_by { |w| w.start_time.to_date.beginning_of_week }
    @workouts = @workouts[DateTime.now.beginning_of_week.to_date]
    
<<<<<<< HEAD
=======
    #@workouts = @workouts.group_by { |w| w.start_time.to_date.beginning_of_day}

>>>>>>> e89bb3b366f9e2a2a255720fa33755e8c50856de
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
    params.require(:workout).permit(:activity, :start_time, :location)
  end

end