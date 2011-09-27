require "readingtime/version"
require "readingtime/core_ext"

module Readingtime

  def self.minutes(words)
    (words / 200).floor
  end

  def self.seconds(words)
    (words % 200 / (200 / 60)).floor
  end

  def self.format_seconds(seconds)
    '%d:%02d' % seconds.divmod(60)
  end

end
