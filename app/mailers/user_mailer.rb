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

  def workout_invitation(invite)
    @invite = invite

    mail to: @invite.target.email, subject: "You've been invited to workout!"
  end

  def app_invite(email, user)  
    @user = user

    mail to: email, subject: "#{@user.username} has invited you to join FitByFriday!"
  end
end
