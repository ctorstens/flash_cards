 
######################################################
# CREATE
######################################################
get '/card/create_card' do
  "This is where you go to create a card"
  erb :create_card
end

post '/card/create_card' do
  "This is where you create a card"
  Card.create(params[:question], params[:answer])
  erb :card_profile
end

######################################################
# READ
######################################################
get '/card/:id' do
  "This is where you will view a card"
  @card = Card.find(params)
  erb :card_profile
end


######################################################
# UPDATE
######################################################

get '/card/:id/edit' do
"this page, you'll edit a card"
  erb :edit_card ## or create card???
end

post 'card/:id/edit' do
  @card = Card.find(params[:id])
  @card.update_attributes(params[:answer], params[:question])
  erb :card_profile
end

######################################################
# DESTROY
######################################################

delete '/card/:id' do
  @card = Card.find(params[:id])
  @card.destroy
  erb :card_profile
end


