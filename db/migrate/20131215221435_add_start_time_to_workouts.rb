class AddStartTimeToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :start_time, :time
  end
end
