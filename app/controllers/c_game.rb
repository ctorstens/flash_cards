get '/play_deck' do
  erb :play
end


post '/play_deck/:id' do
  @user = User.where(token: session[:token]).first
  @current_round = Round.create(deck_id: params[:id], user_id: @user.id, count_correct: 0, count_wrong: 0 )
  @current_card = @current_round.deck.cards[0]
  @current_question = @current_card.question 
  session[:round_id] = @current_round.id
  session[:card_index] = 0
  erb :play
end

post '/next_question' do
  puts params['correctness']
  @current_round = Round.last
  @current_card = @current_round.deck.cards[session[:card_index]]
  @current_question = @current_card.question
  if params['correctness'] == "correct"
    @current_round.count_correct += 1
    @current_round.save
    puts 'correct!!'
  else
    @current_round.count_wrong += 1
    @current_round.save
    puts 'incorrect!!'
  end

  if params['answer'] == "answer"
    @current_answer = @current_card.answer
  end
  
  session[:card_index] += 1
  @current_round.save
  erb :play
end




