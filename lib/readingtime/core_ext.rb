String.class_eval do
  def reading_time
    word_size = self.calculate_size
    
    minutes = Readingtime.minutes(word_size)
    seconds = Readingtime.seconds(word_size)
    
    return minutes.to_s + ":" + Readingtime.time_in_words(seconds)
    
  end

  def calculate_size
    self.scan(/(\w|-)+/).size
  end

end