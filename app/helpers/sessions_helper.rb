module SessionsHelper
  #logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end
  #remembers a user in persistent position
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  #returns true if the given user is the current user
  def current_user?(user)
    user == current_user
  end
  #returns the current logged-in ser(if any)
  def current_user
    if (user_id = session[:user_id])	
      @current_user ||= User.find_by(id: session[:user_id])
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user_id
      end
    end



  end
  #returns true if the user is logged in,false otherwise
  def logged_in?
    !current_user.nil?
  end
  #forgets a persistent session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:rememeber_token)
  end
  #logs out the current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  #rediretcs to stored location(or to the default)
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
  #stures the URL trying to be accessed
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
