class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :workout_id
      t.integer :sender_id
      t.integer :target_id

      t.timestamps
    end
  end
end
