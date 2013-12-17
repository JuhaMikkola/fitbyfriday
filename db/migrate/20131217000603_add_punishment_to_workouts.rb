class AddPunishmentToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :punishment, :text
  end
end
