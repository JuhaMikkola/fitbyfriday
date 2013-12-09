class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :activity
      t.string :location
      t.datetime :start_time

      t.timestamps
    end
  end
end
