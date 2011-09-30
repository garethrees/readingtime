String.class_eval do
  def reading_time
    word_size = self.calculate_size
    
    minutes = Readingtime.minutes_in_seconds(word_size)
    seconds = Readingtime.seconds(word_size)
    
    return Readingtime.format_seconds((minutes + seconds))
    
  end

  def calculate_size
    self.scan(/(\w|-)+/).size
  end

end