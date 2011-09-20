String.class_eval do
  def reading_time
    word = self.scan(/(\w|-)+/).size
    
    minutes = (word / 200).floor
    seconds = (word % 200 / (200 / 60)).floor
    
    return minutes.to_s + ":" + seconds.to_s
    
  end
end