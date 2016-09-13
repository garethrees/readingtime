# encoding: utf-8
module Readingtime
  class Configuration
    attr_accessor :reading_speed

    def initialize
      @reading_speed = 200
    end
  end
end
