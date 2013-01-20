String.class_eval do
  def reading_time(options = {})
    format_options = options[:format] || :basic

    word_size = self.calculate_size
    minutes = Readingtime.minutes_in_seconds(word_size)
    seconds = Readingtime.seconds(word_size)
    
    case format_options
    when :basic
      Readingtime.format_seconds((minutes + seconds))
    when :long
      Readingtime.format_words((minutes + seconds))
    when :approx
      Readingtime.format_approx((minutes + seconds))
    end
    
  end

  def calculate_size
    self.scan(/(\w|-)+/).size
  end

end