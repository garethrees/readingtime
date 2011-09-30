require "readingtime/version"
require "readingtime/core_ext"

module Readingtime

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

end
