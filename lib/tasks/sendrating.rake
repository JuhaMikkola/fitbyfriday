task :sendrating => :environment do

  ratings = Rating.includes(:workout)
                  .where("confirmed IS NULL")
                  .where("workouts.start_date = ?", Date.today)

  #find ratings that have no confirmation status or are not confirmed that started today

  ratings.each do |r|
    UserMailer.rating_invite(r.rater, r.rated).deliver
  end

  #mail the rater a rating_invite to rate the rated

end