class Facebook 


  include HTTParty

  base_uri 'https://graph.facebook.com'

  TOKEN = get("/oauth/access_token?client_id=#{ENV['FACEBOOK_ID']}&client_secret=#{ENV['FACEBOOK_SECRET']}&grant_type=client_credentials")


  def self.get_data
    response = get("/TriviaKings/posts?", query: {access_token: TOKEN.as_json.split('=')[1]})
    FacebookMessages.new response["data"].first(2).map {|p| p['message']}
  end

end