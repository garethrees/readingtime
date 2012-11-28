require "readingtime/version"
require "readingtime/core_ext"

module Readingtime

  def self.hms(secs)
    h, m, s = 0, 0, 0
    h = secs / 3600
    secs -= h * 3600
    m = secs / 60
    secs -= m * 60
    [h, m, secs]
  end

  def self.minutes_in_seconds(words)
    (words / 200).floor * 60
  end

  def self.seconds(words)
    (words % 200 / (200 / 60)).floor
  end

  # TODO: Account for HH:MM:00
  def self.format_seconds(seconds)
    '%02d:%02d' % seconds.divmod(60)
  end

  def self.format_words(seconds)
    '%d minutes and %d seconds' % seconds.divmod(60)
  end

  def self.format_full(hms)
    r, h, m, s = [], hms[0], hms[1], hms[2]
    r << "#{h} #{h == 1 ? 'hr' : 'hrs'}" if h > 0
    r << "#{m} #{m == 1 ? 'min' : 'mins'}" if m > 0
    r << "#{s} #{s == 1 ? 'sec' : 'secs'}" if s > 0
    r.join(" ")
  end

end
