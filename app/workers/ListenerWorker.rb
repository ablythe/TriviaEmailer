class ListenerWorker

  include Sidekiq::Worker 
  include Sidetiq::Schedulable

  reccurance {day_of_week(3).hour_of_day(13)}

  def perform
    unless Week.completed?
      data = Week.both_found?
      if data
        TriviaMailer.weds_email data
        Week.create :data
      end
    end
  end

end