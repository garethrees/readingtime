# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "readingtime/version"

Gem::Specification.new do |s|
  s.name        = "readingtime"
  s.version     = Readingtime::VERSION
  s.authors     = ["Gareth Rees"]
  s.email       = ["gareth@garethrees.co.uk"]
  s.homepage    = "http://github.com/garethrees/readingtime"
  s.summary     = %q{Estimates reading time}
  s.description = %q{Estimates reading time of a Ruby String object}

  s.rubyforge_project = "readingtime"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
