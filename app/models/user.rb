class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  has_many :user_workouts
  has_many :workouts, through: :user_workouts

  has_many :sent_friendships, :class_name => "Friendship", foreign_key: "sender_id"
  has_many :target_friendships, :class_name => "Friendship", foreign_key: "target_id"

  has_many :sent_requests, :class_name => "Invitation", foreign_key: "sender_id"
  has_many :received_requests, :class_name => "Invitation", foreign_key: "target_id"

  has_many :sent_ratings, :class_name => "Rating", foreign_key: "rater_id"
  has_many :received_ratings, :class_name => "Rating", foreign_key: "rated_id"

end