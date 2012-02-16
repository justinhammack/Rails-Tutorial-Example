module SessionsHelper

  def sign_in(user) # already authenticated, this creates a session for the user
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user # see assignment method below, one time necessity
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user) # assignment method unique to ruby
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token # checks if current_user exists
  end

  def sign_out
    cookies.delete(:remember_token)
  end

  private

    def user_from_remember_token
      remember_token = cookies[:remember_token]
      User.find_by_remember_token(remember_token) unless remember_token.nil?
    end
end
