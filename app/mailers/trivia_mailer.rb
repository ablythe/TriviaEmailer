class TriviaMailer < ApplicationMailer
  default from: "Alexander.Blythe@gmail.com"

  def weds_email data 
    @qotd, @clue_one, @clue_two = data[:qotd], data[:clue_one], data[:clue_two]
    mail to: "Alexander.Blythe@gmail.com", subject: "Trivia!"
  end 
end
