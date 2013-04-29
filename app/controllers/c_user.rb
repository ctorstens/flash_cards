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
  if session[:token]
    redirect '/user_profile'
  else
    @message = "Sorry that email is already taken!"
    erb :index
  end
end

get '/user_profile' do
  if session[:token]
    @current_user_rounds = Round.where(user_id: current_user.id)
    erb :user_profile
  else
    @message = "Sorry you are not logged in!"
    erb :index
  end
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
  redirect '/user_profile'
end


post '/logout' do
  @user = current_user
  @user.token = nil
  @user.save
  session.clear
  erb :index
end


######################################################
# UPDATE
######################################################





######################################################
# DESTROY
######################################################

