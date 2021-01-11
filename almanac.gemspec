# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'almanac/version'

Gem::Specification.new do |spec|
  spec.name          = "almanac"
  spec.version       = Almanac::VERSION
  spec.authors       = ["shawn corey campbell"]
  spec.email         = ["shacoca@yahoo.com"]

  # **********************************************
  # keep curly braces and %q?
  spec.summary       = %q{Read The Old Farmer's Almanac from the command line.}
  spec.description   = %q{Chuck your browser and read TOFA old-school.}
  spec.homepage      = "https://github.com/shacoca/almanac"
  spec.license       = "MIT" # uncomment this line if MIT is the best license for your situation

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "colorize"
end
