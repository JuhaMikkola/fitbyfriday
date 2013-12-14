class Rating < ActiveRecord::Base

  belongs_to :rated, :class_name => "User", foreign_key: "rated_id"
  belongs_to :rater, :class_name => "User", foreign_key: "rater_id"

  belongs_to :workout

end
