get '/play_deck' do
  erb :play
end


post '/play_deck' do
  @current_round = Round.create(deck_id: 1, user_id: 1, card_id: 1, count_correct: 0, count_wrong: 0 )
  @current_card = Card.find(@current_round.card_id)
  @current_question = @current_card.question
  erb :play
end

post '/next_question' do
  @current_round = Round.last
  @current_round.card_id += 1
  @current_round.save
  @current_card = Card.find(@current_round.card_id)
  @current_question = @current_card.question
  erb :play
end

post '/show_answer' do
  @current_round = Round.last
  @current_card = Card.find(@current_round.card_id)
  @current_answer = @current_card.answer
  @current_question = @current_card.question
  redirect '/next_question'
end 

post '/correct' do
  @current_round = Round.last
  @current_round.count_correct += 1
  @current_round.save
  @current_card = Card.find(@current_round.card_id)
  @current_answer = @current_card.answer
  @current_question = @current_card.question
  redirect '/next_question'
end 

post '/incorrect' do
  @current_round = Round.last
  @current_round.count_wrong += 1
  @current_round.save
  @current_card = Card.find(@current_round.card_id)
  @current_answer = @current_card.answer
  @current_question = @current_card.question
  erb :play
end



