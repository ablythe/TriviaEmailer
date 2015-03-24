class ListenerWorker

  include Sidekiq::Worker 
  include Sidetiq::Schedulable

  recurrence do
    minutely(5).hour_of_day(20,21,22).day(:tuesday)
  end

  def perform
    unless Week.completed?
      data = Week.both_found?
      if data
        package = Week.parse_data data
        TriviaMailer.weds_email(package).deliver_now
        Week.create data: package
      end
    end
  end

end

