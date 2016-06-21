Dir[File.dirname(__FILE__) + '/readingtime/*.rb'].each do |file|
  require file
end

module Readingtime
  class << self
    attr_accessor :configuration
  end

  def self.configure
    yield(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  class Configuration
    attr_accessor :reading_speed

    def initialize
      @reading_speed = 200
    end
  end

  def self.hms(secs)
    h, m, s = 0, 0, 0
    h = secs / 3600
    secs -= h * 3600
    m = secs / 60
    secs -= m * 60
    [h, m, secs]
  end

  def self.minutes_in_seconds(words)
    (words / configuration.reading_speed).floor * 60
  end

  def self.seconds(words)
    (words % configuration.reading_speed / (configuration.reading_speed / 60)).floor
  end

  # TODO: Account for HH:MM:00
  def self.format_seconds(seconds)
    '%02d:%02d' % seconds.divmod(60)
  end

  def self.format_words(seconds)
    if seconds >= 60
      '%d minutes and %d seconds' % seconds.divmod(60)
    else
      "#{ seconds } seconds"
    end
    
  end

  def self.format_approx(seconds)
    if seconds > 59
      '%d minutes' % (seconds.to_f/60).round
    else 
      '%d seconds' % seconds
    end
  end

  def self.format_full(hms)
    r, h, m, s = [], hms[0], hms[1], hms[2]
    r << "#{h} #{h == 1 ? 'hr' : 'hrs'}" if h > 0
    r << "#{m} #{m == 1 ? 'min' : 'mins'}" if m > 0
    r << "#{s} #{s == 1 ? 'sec' : 'secs'}" if s > 0
    r.join(" ")
  end

end
