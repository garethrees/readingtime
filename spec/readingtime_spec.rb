# encoding: utf-8
path = File.expand_path(File.dirname(__FILE__) + "/../lib/")
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
require "readingtime"


describe Readingtime do
  let(:short_text) { "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." }
  let(:long_text)  { ("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." * 100) }


  it "should calculate the length of the string input" do
    short_text.calculate_size.should == short_text.scan(/(\w|-)+/).size
  end


  it "should calculate the number of minutes the reading should take" do
    words = short_text.calculate_size
    Readingtime.minutes(words).should == (words / 200).floor
  end

  it "should calculate the remaining seconds the reading should take" do
    words = short_text.calculate_size
    Readingtime.seconds(words).should == (words % 200 / (200 / 60)).floor
  end

  it "should display the reading time in a readable format" do
    short_text.reading_time.should == "0:23"
  end

end