class Workout < ActiveRecord::Base

  belongs_to :creator, :class_name => "User"

  has_many :user_workouts
  has_many :users, through: :user_workouts
  
  has_many :invitations

  has_many :ratings

  validate :start_time_cannot_be_in_the_past

  def start_time_cannot_be_in_the_past
    if start_date.present? && start_date.to_date < Date.today
      errors.add(:start_time, "can't be in the past")
    end
  end
  
end
  