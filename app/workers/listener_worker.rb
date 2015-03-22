class ListenerWorker

  include Sidekiq::Worker 

  def self.perform
    unless Week.completed?
      data = Week.both_found?
      if data
        package = Week.parse_data data
        TriviaMailer.weds_email(package).deliver_later
        Week.create data: package
      end
    end
  end

end

