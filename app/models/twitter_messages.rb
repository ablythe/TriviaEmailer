class TwitterMessages

  attr_reader :messages

  def initialize message_array
    @messages = message_array
  end

  def include_term? 
    messages.find {|m| m.include?("Wednesday's #RoundClue")}
  end

end