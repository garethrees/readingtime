String.class_eval do
  def reading_time(options = {})
    calculator = options[:calculator] || Readingtime::Calculator.new
    format_options = options[:format] || :basic
    calculator.reading_time(self, :format => format_options)
  end

  def calculate_size
    self.scan(/(\w|-)+/).size
  end
end
