class AddConfirmedToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :confirmed, :boolean, default: false
  end
end
