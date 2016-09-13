# encoding: utf-8
path = File.expand_path(File.dirname(__FILE__) + "/../../lib/")
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
require "readingtime"

describe Readingtime::Configuration do

  describe '.new' do
    it 'sets the default reading_speed' do
      subject.reading_speed.should == 200
    end
  end

  describe '#reading_speed' do
    it 'returns the reading_speed' do
      subject.reading_speed.should == 200
    end
  end

  describe '#reading_speed=' do
    it 'sets the reading_speed' do
      subject.reading_speed = 250
      subject.reading_speed.should == 250
    end
  end

end
