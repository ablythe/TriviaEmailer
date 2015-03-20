class TwitterApi

  CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["twitter_consumer_key"]
    config.consumer_secret     = ENV["twitter_consumer_secret"]
    config.access_token        = ENV["twitter_access_token"]
    config.access_token_secret = ENV["twitter_access_token_secret"]
  end
  
  def self.get_data
    response = CLIENT.user_timeline("TriviaKings") 
    response.map {|tweet| tweet.text}
  end

  def self.include_term? term 
    messages = get_data
    messages.select {|m| m.include?(term)}
  end
end