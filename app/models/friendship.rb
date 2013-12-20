class Friendship < ActiveRecord::Base

  # belongs_to :user

  belongs_to :sender, class_name: "User", foreign_key: 'sender_id'
  belongs_to :target, class_name: "User", foreign_key: 'target_id'

  validates [:sender, :target], :uniqueness => true
  # def friends


end