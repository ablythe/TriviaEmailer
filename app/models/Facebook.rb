class Facebook 


  include HTTParty

  base_uri 'https://graph.facebook.com'

  TOKEN = get("/oauth/access_token?client_id=#{ENV['FACEBOOK_ID']}&client_secret=#{ENV['FACEBOOK_SECRET']}&grant_type=client_credentials")


  def self.get_data
    response =get("/TriviaKings/posts?", query: {access_token: TOKEN.as_json.split('=')[1]})
    response["data"].first(2).map {|p| p["message"] != nil ? p["message"] : ""}
  end

  def self.include_term? messages, term
    messages.select {|m| m[/Tuesday.*QOTD/]}
  end


end