#sign in
#sign out
#create new user


get '/' do
  erb :dummy_index
end



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

  # session[:token] = @user.id
  ##SET SESSION ID
  erb :dummy_index
end



######################################################
# READ
######################################################
post '/sign_in' do
  @user = User.authenticate(params[:email], params[:password])
  if @user 
    ##SET SESSION ID
    # erb :user_profile ###### CHANGE
    @message = "You are logged in!"
    erb :dummy_index
  else
    #error message
    # erb :index
  end
end

# # # profile page
# get '/user/:id' do
#   @user = User.find(params[:id])
#   # erb :user_profile
# end





######################################################
# UPDATE
######################################################





######################################################
# DESTROY
######################################################
# post '/logout'
# ####destroy session
#  session.clear
  # erb :index
# end
