class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true

  has_many :workouts, foreign_key: "creator_id"

  #has_many :invitations, foreign_key: "target_id"

  #has_many :invited_workouts, through: :invitations, :class_name => "Workout"


has_many :sent_requests, :class_name => "Invitation", foreign_key: "sender_id"
has_many :received_requests, :class_name => "Invitation", foreign_key: "target_id"

end