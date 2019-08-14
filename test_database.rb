require 'pg'
require_relative 'database_persistence'
require 'pry'

connection = PG.connect(dbname: 'codecards')
db = DatabasePersistence.new

def basic_test
  # Test creation and retrieval of user ids
  user_id = db.user_id('public')
  p user_id == '1'
  p db.user_id('hello') == nil
  
  data = {
    'nicki_minaj': ['megatron', 'no frauds', 'majesty'],
    'lee_hi': ['no one'],
    'bobby': ['tendae', 'holup!']
  }
  
  data.each do |username, set_titles|
  #  db.add_user(username)
    user_id = db.user_id(username)
    set_titles.each do |title|
      # db.add_set(title, user_id)
      puts "set id of #{title} is #{db.set_id(title, user_id)}"
    end
  end
end

def test_retrieval_of_cards
  username = 'public' 
  title = 'Core Ruby Tools' 
  user_id = db.user_id(username)
  set_id = db.set_id(title, user_id) 
  cards = db.cards(set_id)
  binding.pry
  puts ""
end

test_retrieval_of_cards