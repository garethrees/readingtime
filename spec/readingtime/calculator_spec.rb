# encoding: utf-8
path = File.expand_path(File.dirname(__FILE__) + "/../../lib/")
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
require "readingtime"

describe Readingtime::Calculator do
  let(:two_hundred_words) { ("Lorem " * 200) }
  let(:three_hundred_words) { ("Lorem " * 300) }
  let(:ten_words) { ("Lorem " * 10) }

  describe '.new' do
    it 'sets a default reading_speed' do
      subject.reading_speed.should eq(200)
    end

    it 'allows a custom reading speed' do
      subject = described_class.new(:reading_speed => 250)
      subject.reading_speed.should eq(250)
    end
  end

  describe '#reading_time' do
    it "should calculate the reading time of some text" do
      subject.reading_time(two_hundred_words).should == "01:00"
      subject.reading_time(three_hundred_words).should == "01:33"
    end

    it "should accept an options hash to format the output" do
      subject.reading_time(ten_words, :format => :long).should == "3 seconds"
      subject.reading_time(two_hundred_words, :format => :basic).should == "01:00"
      subject.reading_time(two_hundred_words, :format => :long).should == "1 minutes and 0 seconds"
      subject.reading_time(two_hundred_words, :format => :approx).should == "1 minutes"
      subject.reading_time(three_hundred_words, :format => :long).should == "1 minutes and 33 seconds"
      subject.reading_time(three_hundred_words,:format => :approx).should == "2 minutes"
    end

    it "should return a time in seconds when using approx with time less than 1 minute" do
      subject.reading_time(ten_words, :format => :approx).should == "3 seconds"
      subject.reading_time(three_hundred_words, :format => :full).should == '1 min 33 secs'
      subject.reading_time(two_hundred_words, :format => :raw).should == [0, 1, 0]
    end
  end

  describe '#calculate_size' do
    it "should calculate the length of the string input" do
      subject.calculate_size(two_hundred_words).should == 200
    end
  end

  describe '#minutes_in_seconds' do
    it "should calculate the number of minutes the reading should take" do
      words = subject.calculate_size(two_hundred_words)
      subject.minutes_in_seconds(words).should == 60
    end
  end

  describe '#seconds' do
    it "should calculate the remaining seconds the reading should take" do
      words = subject.calculate_size(two_hundred_words)
      subject.seconds(words).should == 0
    end
  end

  describe '#format_seconds' do
    it "should format the reading time in an MM:SS format" do
      subject.format_seconds(3600).should == "60:00"
      subject.format_seconds(60).should == "01:00"
      subject.format_seconds(10).should == "00:10"
      subject.format_seconds(1).should == "00:01"
    end
  end

  describe '#format_full' do
    it "should format the reading time in words" do
      subject.format_full([1, 0, 0]).should == "1 hr"
      subject.format_full([2, 0, 0]).should == "2 hrs"
      subject.format_full([1, 1, 0]).should == "1 hr 1 min"
      subject.format_full([2, 2, 0]).should == "2 hrs 2 mins"
      subject.format_full([1, 1, 1]).should == "1 hr 1 min 1 sec"
      subject.format_full([2, 2, 2]).should == "2 hrs 2 mins 2 secs"
    end
  end

  describe '#format_approx' do
    it "should format the reading time to the nearest minute" do
      subject.format_approx(3600).should == "60 minutes"
      subject.format_approx(119).should == "2 minutes"
      subject.format_approx(61).should == "1 minutes"
      subject.format_approx(60).should == "1 minutes"
      subject.format_approx(59).should == "59 seconds"
    end
  end

  describe '#hms' do
    it "should format the reading time in an array of hours, minutes, seconds" do
      subject.hms(3600).should == [1, 0, 0]
      subject.hms(60).should == [0, 1, 0]
      subject.hms(10).should == [0, 0, 10]
      subject.hms(1).should == [0, 0, 1]
    end
  end
end
