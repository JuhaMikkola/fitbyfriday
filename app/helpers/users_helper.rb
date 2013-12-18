module UsersHelper

  def avatar_url(user)
    if user.avatar.present?
      user.avatar
    else
      default_url = "#{root_url}images/guest.png"
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=80&d=#{CGI.escape(default_url)}"
    end
  end


end
