require "readingtime/version"
require "readingtime/core_ext"

module Readingtime

  def self.minutes(words)
    (words / 200).floor
  end

  def self.seconds(words)
    (words % 200 / (200 / 60)).floor
  end

  def self.time_in_words(time)
    if time < 10
      return "0#{time}"
    else
      return time.to_s
    end
  end

end
