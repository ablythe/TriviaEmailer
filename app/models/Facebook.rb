class Facebook 

  include HTTParty

  base_uri 'https://graph.facebook.com'

  def self.get_data
    response =get("/TriviaKings/posts?access_token=#{ENV['facebook']}")
    response["data"].first(3).map {|p| p["message"]}
  end

  def self.include_term? term
    messages = get_data
    messages.select {|m| m.include?(term)}
  end


end