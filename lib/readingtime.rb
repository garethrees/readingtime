require "readingtime/version"
require "readingtime/core_ext"

module Readingtime

  # FIXME: Calculate minutes_in_seconds
  def self.minutes(words)
    (words / 200).floor
  end

  def self.seconds(words)
    (words % 200 / (200 / 60)).floor
  end

  # TODO: Account for HH:MM:00
  def self.format_seconds(seconds)
    '%d:%02d' % seconds.divmod(60)
  end

end
