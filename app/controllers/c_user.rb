######################################################
# CREATE
######################################################

post '/create_user' do
  @new_user = User.create({
    first_name: params['first_name'],
    last_name: params['last_name'],
    email: params['email'],
    password: params['password']
    })

  session[:token] = @new_user.token

  erb :user_profile
end



###############################################################
# READ
###############################################################


post '/login' do
  @user = User.authenticate(params['email'], params['password'])
  return 403 if @user == nil
  new_token = get_token
  @user.token = new_token
  @user.save
  session[:token] = @user.token
  nil
  erb :user_profile
end

post '/play' do
  erb :play
end

post '/logout' do
  the_user = User.find_by_token(session[:token])
  the_user.update_attributes(:token => nil)
  the_user.save
  session[:token] = nil
  redirect '/'
end



######################################################
# UPDATE
######################################################





######################################################
# DESTROY
######################################################

