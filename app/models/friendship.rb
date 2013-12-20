class Friendship < ActiveRecord::Base

  # belongs_to :user

  belongs_to :sender, class_name: "User", foreign_key: 'sender_id'
  belongs_to :target, class_name: "User", foreign_key: 'target_id'

  validates :target, :uniqueness => { scope: :sender }
  validates :sender, :uniqueness => { scope: :target }
  # def friends


end