class Workout < ActiveRecord::Base

  belongs_to :creator, :class_name => "User"

  has_many :user_workouts
  has_many :users, through: :user_workouts
  
  has_many :invitations

  has_many :ratings

  validate :start_time_cannot_be_in_the_past

  def start_time_cannot_be_in_the_past
    if start_time.present? && start_time.to_date < Date.today
      errors.add(:start_time, "can't be in the past")
    end
  end
  
end
  