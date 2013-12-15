class RemoveStartTimeFromWorkouts < ActiveRecord::Migration
  def change
    remove_column :workouts, :start_time, :datetime
  end
end
