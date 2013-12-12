class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :sender_id
      t.integer :target_id
      t.boolean :confirmed

      t.timestamps
    end
  end
end
