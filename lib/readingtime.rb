# encoding: utf-8
Dir[File.dirname(__FILE__) + '/readingtime/*.rb'].each do |file|
  require file
end

module Readingtime
  class << self
    attr_accessor :configuration
  end

  def self.configure
    yield(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reading_speed
    configuration.reading_speed
  end

  def self.hms(secs)
    calculator = Calculator.new(:reading_speed => self.reading_speed)
    calculator.hms(secs)
  end

  def self.minutes_in_seconds(words)
    calculator = Calculator.new(:reading_speed => self.reading_speed)
    calculator.minutes_in_seconds(words)
  end

  def self.seconds(words)
    calculator = Calculator.new(:reading_speed => self.reading_speed)
    calculator.seconds(words)
  end

  # TODO: Account for HH:MM:00
  def self.format_seconds(seconds)
    calculator = Calculator.new(:reading_speed => self.reading_speed)
    calculator.format_seconds(seconds)
  end

  def self.format_words(seconds)
    calculator = Calculator.new(:reading_speed => self.reading_speed)
    calculator.format_words(seconds)
  end

  def self.format_approx(seconds)
    calculator = Calculator.new(:reading_speed => self.reading_speed)
    calculator.format_approx(seconds)
  end

  def self.format_full(hms)
    calculator = Calculator.new(:reading_speed => self.reading_speed)
    calculator.format_full(hms)
  end
end
