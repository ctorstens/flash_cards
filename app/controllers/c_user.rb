######################################################
# CREATE
######################################################

post '/create_user' do
  User.create({
    first_name: params['first_name'],
    last_name: params['last_name'],
    email: params['email'],
    password: params['password']
    })


  #SET SESSION ID
  erb :user_profile
end



###############################################################
# READ
###############################################################


post '/login' do

  the_token = User.authenticate(params['email'], params['password'])
  return 403 unless the_token
  session[:token] = the_token
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

