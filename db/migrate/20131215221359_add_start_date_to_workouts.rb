class AddStartDateToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :start_date, :date
  end
end
