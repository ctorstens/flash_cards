#####################################################
# CREATE
#####################################################

get '/deck/create_deck' do
  "This is where you go to create a deck"
  erb :create_deck
end

post '/deck/create_deck' do
  "This is where you create a deck"
  Deck.create(params[:name])
  erb :deck_profile
end


#####################################################
# READ
#####################################################

get '/deck/:id' do
  "This is where you will view a deck"
  session[:deck_id] = 
  erb :deck_profile
end


#####################################################
# UPDATE
#####################################################

get '/deck/:id/edit' do
  "this page, you'll edit a deck"
  erb :edit_deck
end

post 'card/:id/edit' do
  @deck = Deck.find(params[:id])
  @deck.update_attributes(params[:answer], params[:question])
  erb :card_profile
end


#####################################################
# DESTROY
#####################################################

delete '/deck/:id' do
  #This route will remove the resource from the server
  @deck = Deck.find(params[:id])
  @deck.destroy
  erb :deck_profile
end
