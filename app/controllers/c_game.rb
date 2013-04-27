get '/play_deck' do
  erb :play_deck
end


post '/play_deck' do
  @current_round = Round.create(deck_id: 1, user_id: 1, deck_id: 1, count_correct: 0, count_wrong: 0 )
  p @current_round
  @current_deck = Card.all
  @current_question = @current_deck[0].question
  erb :play_deck
end


post '/see_answer' do
  @current_deck = Card.all
  @current_question = @current_deck[0].question
  @current_answer = @current_deck[0].answer
 erb :play_deck
end 

post '/correct' do
  @current_round = Round.last
  @current_round.count_correct += 1
  @current_round.save
  erb :play_deck
end 

post '/incorrect' do
  @current_round = Round.last
  p @current_round
  @current_round.count_wrong += 1
  @current_round.save
  erb :play_deck
end
