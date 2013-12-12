class Workout < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  has_many :user_workouts
  has_many :users, through: :user_workouts
  has_many :invitations
end
  