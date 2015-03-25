class TwitterApi

  CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
  
  def self.get_data user
    response = CLIENT.user_timeline(user) 
    response.first(9).map {|tweet| tweet.text}
  end

  def self.include_term? messages
    weds_messages= messages.select {|m| m[/Wednesday.*QOTD/]}
    weds_messages[0]
  end
end