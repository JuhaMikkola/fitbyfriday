class UserMailer < ActionMailer::Base
  default from: "info@fitbyfriday.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "Sign Up Confirmation"
  end

  def punishment(workout, user)
    @user = user
    @workout = workout
    
    mail to: user.email, subject: "You Missed a Workout with #{@user.username}"
  end

end
