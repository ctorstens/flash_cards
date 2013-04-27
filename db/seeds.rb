require 'faker'

# Create Users
1.times do 
  User.create({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 1234
    })
end
users = User.all

# Create Decks
3.times do
  Deck.create({
    name: Faker::Lorem.word
    })
end
decks = Deck.all

# Create Cards
64.times do
  Card.create({
    question: Faker::Lorem.sentence,
    answer: Faker::Lorem.word,
    deck: decks.sample
    })
end

# Create Rounds
30.times do
  the_deck = decks.sample
  c_correct = the_deck.cards.length - rand(the_deck.cards.length)
  c_wrong = the_deck.cards.length - c_correct
  Round.create({
    deck: the_deck,
    user: users.sample,
    count_correct: c_correct,
    count_wrong: c_wrong
    })
end