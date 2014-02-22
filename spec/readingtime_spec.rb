# encoding: utf-8
path = File.expand_path(File.dirname(__FILE__) + "/../lib/")
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
require "readingtime"


describe Readingtime do
  let(:two_hundred_words) { ("Lorem " * 200) }
  let(:three_hundred_words) { ("Lorem " * 300) }

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

  it "should format the reading time in words" do
    Readingtime.format_full([1, 0, 0]).should == "1 hr"
    Readingtime.format_full([2, 0, 0]).should == "2 hrs"
    Readingtime.format_full([1, 1, 0]).should == "1 hr 1 min"
    Readingtime.format_full([2, 2, 0]).should == "2 hrs 2 mins"
    Readingtime.format_full([1, 1, 1]).should == "1 hr 1 min 1 sec"
    Readingtime.format_full([2, 2, 2]).should == "2 hrs 2 mins 2 secs"
  end

  it "should format the reading time in an array of hours, minutes, seconds" do
    Readingtime.hms(3600).should == [1, 0, 0]
    Readingtime.hms(60).should == [0, 1, 0]
    Readingtime.hms(10).should == [0, 0, 10]
    Readingtime.hms(1).should == [0, 0, 1]
  end

  it "should accept an options hash to format the output" do
    two_hundred_words.reading_time(:format => :basic).should == "01:00"
    two_hundred_words.reading_time(:format => :long).should == "1 minutes and 0 seconds"
    three_hundred_words.reading_time(:format => :long).should == "1 minutes and 33 seconds"
    three_hundred_words.reading_time(:format => :full).should == '1 min 33 secs'
    two_hundred_words.reading_time(:format => :raw).should == [0, 1, 0]
  end

end