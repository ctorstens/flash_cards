

###############################################################
# CREATE
###############################################################

# get '/user/create' do
#   "create a new user"
#   erb :form_create_user
# end

# post '/user/create' do
#   u = User.create({
#     first_name: params[:first_name],
#     last_name: params[:last_name],
#     email: params[:email],
#     user_name: params[:user_name],
#     password: params[:password],
#     })
#   puts "SUCCESS"
#   erb :index
# end


###############################################################
# READish
###############################################################


# get '/login' do
#   erb :login
# end

post '/login' do
  the_token = User.authenticate(params['email'], params['password'])
  return 403 unless the_token
  session[:token] = the_token.reset_token
  erb :index
end

post '/logout' do
  the_user = User.find_by_token(session[:token])
  the_user.update_attributes(:token => nil)
  the_user.save
  session[:token] = nil
  redirect '/'
end




###############################################################
# UPDATE
###############################################################



###############################################################
# DESTROY
###############################################################
