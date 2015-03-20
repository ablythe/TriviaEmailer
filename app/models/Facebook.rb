class Facebook 

  include HTTParty

  base_uri 'https://graph.facebook.com'

  TOKEN = get("/oauth/access_token?client_id=#{ENV['facebook_id']}&client_secret=#{ENV['facebook_secret']}&grant_type=client_credentials")


  def self.get_data
    response =get("/TriviaKings/posts?#{TOKEN}")
    response["data"].first(3).map {|p| p["message"]}
  end

  def self.include_term? messages, term
    messages.select {|m| m.include?(term)}
  end


end