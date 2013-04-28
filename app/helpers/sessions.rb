helpers do
  def current_user
    # @user ||= User.find_by_token(session[:token])
    User.find_by_token(session[:token])
  end

  def get_token
    # @user = current_user
    # user_pw_hash = @user.password_hash
    # the_seed = user_pw_hash + Time.now.to_s + "kjsd94*asdHH*&h80fh"
    # Digest::MD5.hexdigest(the_seed)

    the_seed = Time.now.to_s + "kjsd94*asdHH*&h80fh"
    Digest::MD5.hexdigest(the_seed)
  end

  def current_round
    @round ||= Deck.find(session[:deck_id])
  end

end
