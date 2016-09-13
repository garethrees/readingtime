# encoding: utf-8
module Readingtime
  class Calculator
    attr_reader :reading_speed

    def initialize(opts = {})
      @reading_speed = opts[:reading_speed] || 200
    end

    def reading_time(words, opts = {})
      format_options = opts[:format] || :basic

      word_size = calculate_size(words)
      minutes = Readingtime.minutes_in_seconds(word_size)
      seconds = Readingtime.seconds(word_size)

      case format_options
      when :basic
        format_seconds((minutes + seconds))
      when :long
        format_words((minutes + seconds))
      when :approx
        format_approx((minutes + seconds))
      when :full
        hms = hms(minutes + seconds)
        format_full(hms)
      when :raw
        hms(minutes + seconds)
      end
    end

    # Calculations

    def minutes_in_seconds(words)
      (words / reading_speed).floor * 60
    end

    def seconds(words)
      (words % reading_speed / (reading_speed / 60)).floor
    end

    def calculate_size(words)
      words.scan(/(\w|-)+/).size
    end

    # Formatting

    def hms(secs)
      h, m, s = 0, 0, 0
      h = secs / 3600
      secs -= h * 3600
      m = secs / 60
      secs -= m * 60
      [h, m, secs]
    end

    # TODO: Account for HH:MM:00
    def format_seconds(seconds)
      '%02d:%02d' % seconds.divmod(60)
    end

    def format_words(seconds)
      if seconds >= 60
        '%d minutes and %d seconds' % seconds.divmod(60)
      else
        "#{ seconds } seconds"
      end
    end

    def format_approx(seconds)
      if seconds > 59
        '%d minutes' % (seconds.to_f/60).round
      else
        '%d seconds' % seconds
      end
    end

    def format_full(hms)
      r, h, m, s = [], hms[0], hms[1], hms[2]
      r << "#{h} #{h == 1 ? 'hr' : 'hrs'}" if h > 0
      r << "#{m} #{m == 1 ? 'min' : 'mins'}" if m > 0
      r << "#{s} #{s == 1 ? 'sec' : 'secs'}" if s > 0
      r.join(" ")
    end
  end
end
