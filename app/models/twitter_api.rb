class TwitterApi

  CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["twitter_consumer_key"]
    config.consumer_secret     = ENV["twitter_consumer_secret"]
    config.access_token        = ENV["twitter_access_token"]
    config.access_token_secret = ENV["twitter_access_token_secret"]
  end
  
  def self.get_data user
    response = CLIENT.user_timeline(user) 
    response.first(5).map {|tweet| tweet.text}
  end

  def self.include_term? messages, term 
    binding.pry
    messages.select {|m| m.include?(term)}
  end
end