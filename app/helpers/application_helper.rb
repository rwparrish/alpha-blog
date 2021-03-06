module ApplicationHelper

  def gravatar_for(user, options = { size: 80 })
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
  end

  def current_user
    # if a @current_user already exists then simply return it,
    # if not, then find the @current_user if there is a session @obj containing a user_id
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # turn the return of the current_user method into a boolean using the !!
    !!current_user
  end

end
