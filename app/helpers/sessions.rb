helpers do
  def current_user
    @user ||= User.find_by_token(session[:token])
    # User.find_by_token(session[:token])
  end

  def get_token
    user_pw_hash = User.find_by_token(session[:token]).password_hash
    the_seed = user_pw_hash + Time.now.to_s + "kjsd94*asdHH*&h80fh"
    Digest::MD5.hexdigest(the_seed)
  end
end
