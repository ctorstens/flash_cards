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
  puts "first line of login"
  @user = User.authenticate(params['email'], params['password'])
  return 403 if @user == nil
  puts "TOP"
  new_token = get_token
  puts "BOTTOM"
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
  @user = current_user
  @user.token = nil
  @user.save
  session[:token] = nil
  erb :index
end


######################################################
# UPDATE
######################################################





######################################################
# DESTROY
######################################################

