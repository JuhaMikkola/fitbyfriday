class Invitation < ActiveRecord::Base
  belongs_to :workout

  belongs_to :sender, class_name: "User", foreign_key: 'sender_id'
  belongs_to :target, class_name: "User", foreign_key: 'target_id'

  validate :cannot_send_duplicate_invite

  def cannot_send_duplicate_invite
    if Workout.find(workout_id).invitations.any?
      Workout.find(workout_id).invitations.each do |i|
        if i.target_id == target_id
          errors.add(:target_id, "was already invited.")
        end
      end
    end
  end



end
