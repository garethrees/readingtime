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

  s.add_development_dependency 'rake', '~> 10.5.0' if RUBY_VERSION < '1.9.3' # see: https://github.com/travis-ci/travis.rb/issues/380
  s.add_development_dependency 'rake'              unless RUBY_VERSION < '1.9.3'
  s.add_development_dependency "rspec", "~>2.6"

end
