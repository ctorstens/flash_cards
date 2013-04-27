helpers do
  def current_user
    @user ||= User.find_by_token(session[:token]) if session[:token]
  end
end
