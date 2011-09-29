String.class_eval do
  def reading_time
    word_size = self.calculate_size
    
    minutes = Readingtime.minutes(word_size)
    seconds = Readingtime.seconds(word_size)
    
    # FIXME: Minutes is not minutes_in_seconds so calculation is wrong
    return Readingtime.format_seconds((minutes + seconds))
    
  end

  def calculate_size
    self.scan(/(\w|-)+/).size
  end

end