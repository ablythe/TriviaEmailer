class Week < ActiveRecord::Base
  USER = "TriviaKings"

  def self.get_twitter 
    messages = TwitterApi.get_data USER
    messages.include_term? 
  end

  def self.get_facebook
    messages = Facebook.get_data
    messages.include_term? 
  end

  def self.both_found?
    t_data = get_twitter
    f_data = get_facebook
    unless t_data.nil? || f_data.nil?
      data = { twitter: t_data, facebook:f_data }
    end
  end

  def self.parse_data data
    parsed = {}
    parsed[:clue_one] = data[:twitter][/(#Round.*)/]
    parsed[:clue_two] = data[:facebook][/(Round.*)/]
    parsed[:qotd] = data[:facebook][/(QOTD.*\?)/]
    parsed
  end

  def self.completed?
    Week.where(["created_at >?", 1.days.ago]) != []
  end

end
