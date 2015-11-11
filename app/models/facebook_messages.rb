class FacebookMessages

  attr_reader :messages 

  def initialize messages_array
    @messages = messages_array
  end

  def include_term?
    messages.find {|m| m.include?("Wednesday's #QOTD")}
  end
end