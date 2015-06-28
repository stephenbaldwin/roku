# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roku/version'

Gem::Specification.new do |spec|
  spec.name          = "roku"
  spec.version       = Roku::VERSION
  spec.authors       = ["Stephen Baldwin"]
  spec.email         = ["stephenbaldwin@me.com"]
  spec.summary       = %q{Roku Toolkit}
  spec.description   = %q{A set of tools built in Ruby to ease and simplify Roku development and deployment.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rubyzip"
  spec.add_dependency 'mechanize'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
end
