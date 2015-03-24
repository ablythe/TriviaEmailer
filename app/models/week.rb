class Week < ActiveRecord::Base
  TERM = "Tuesday's #QOTD"
  USER = "TriviaKings"

  def self.get_twitter 
    messages = TwitterApi.get_data USER
    TwitterApi.include_term? messages, TERM
  end

  def self.get_facebook
    messages = Facebook.get_data
    Facebook.include_term? messages, TERM
  end

  def self.both_found?
    t_data =get_twitter
    f_data =get_facebook
    unless t_data.empty? || f_data.empty?
      data ={twitter: t_data[0], facebook:f_data[0]}
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
