class ListenerWorker

  include Sidekiq::Worker 
  include Sidetiq::Schedulable

  recurrence do
    minutely(5).hour_of_day(17,18,19,20,21,22).day(:wednesday)
  end

  def perform
    unless Week.completed?
      data = Week.both_found?
      if data
        package = Week.parse_data data
        Week.create data: package
        TriviaMailer.weds_email(package).deliver_now
      end
    end
  end

end

