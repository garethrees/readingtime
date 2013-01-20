# encoding: utf-8
path = File.expand_path(File.dirname(__FILE__) + "/../lib/")
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
require "readingtime"


describe Readingtime do
  let(:two_hundred_words) { ("Lorem " * 200) }
  let(:three_hundred_words) { ("Lorem " * 300) }
  let(:ten_words) { ("Lorem " * 10) }

  it "should calculate the reading time of some text" do
    two_hundred_words.reading_time.should == "01:00"
    three_hundred_words.reading_time.should == "01:33"
  end

  it "should calculate the length of the string input" do
    two_hundred_words.calculate_size.should == 200
  end

  it "should calculate the number of minutes the reading should take" do
    words = two_hundred_words.calculate_size
    Readingtime.minutes_in_seconds(words).should == 60
  end

  it "should calculate the remaining seconds the reading should take" do
    words = two_hundred_words.calculate_size
    Readingtime.seconds(words).should == 0
  end

  it "should format the reading time in an MM:SS format" do
    Readingtime.format_seconds(3600).should == "60:00"
    Readingtime.format_seconds(60).should == "01:00"
    Readingtime.format_seconds(10).should == "00:10"
    Readingtime.format_seconds(1).should == "00:01"
  end

  it "should accept an options hash to format the output" do
    two_hundred_words.reading_time(:format => :basic).should == "01:00"
    two_hundred_words.reading_time(:format => :long).should == "1 minutes and 0 seconds"
    two_hundred_words.reading_time(:format => :approx).should == "1 minutes"
    three_hundred_words.reading_time(:format => :long).should == "1 minutes and 33 seconds"
    three_hundred_words.reading_time(:format => :approx).should == "1 minutes"
  end

  it "should return a time in seconds when using approx with time less than 1 minute" do
    ten_words.reading_time(:format => :approx).should == "3 seconds"
  end

end