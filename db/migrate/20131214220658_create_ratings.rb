class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :workout_id
      t.integer :rated_id
      t.integer :rater_id
      t.boolean :confirmed

      t.timestamps
    end
  end
end
