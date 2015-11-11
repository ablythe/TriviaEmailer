class ListenerWorker

  include Sidekiq::Worker 
  include Sidetiq::Schedulable

  recurrence do
    minutely(5).hour_of_day(13,14,15,16,17,18,19,20,21).day(:wednesday)
  end

  def perform
    puts "before"
    return if Week.completed?
    if Week.both_found?
      package = Week.parse_data data
      Week.create data: package
      TriviaMailer.weds_email(package).deliver_now
    end
  end

end

