# Estimate Reading Time

[![Build Status](https://secure.travis-ci.org/garethrees/readingtime.png)](http://travis-ci.org/garethrees/readingtime)


I use [iA Writer](http://iawriter.com "iA Writer") and find the *estimated reading time* feature pretty handy. I thought it would be cool to add at the top of my blog articles on the web as [others](http://nicepaul.com "The personal blog of @nicepaul") do.

Full credit goes to [Brian Cray](http://briancray.com/2010/04/09/estimated-reading-time-web-design "Brian Cray - Estimated Reading Time in Web Design") for explaining how to do it in PHP.

## How to Use

[readingtime](http://github.com/garethrees/readingtime "Gem to estimate reading time") extends the Ruby String class, so you can call `reading_time` on any string object.

### Example

	@words = "Lorem ipsum dolor sit amet"
	@words.reading_time
		=> "0:01"