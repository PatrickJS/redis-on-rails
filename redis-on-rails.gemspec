# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redis-on-rails/version'

Gem::Specification.new do |spec|
  spec.name          = "redis-on-rails"
  spec.version       = Redis::On::Rails::VERSION
  spec.authors       = ["gdi2290"]
  spec.email         = ["rubygems@gdi2290.com"]
  spec.description   = %q{Simple Redis gem}
  spec.summary       = %q{Simple Redis gem}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.add_dependency "redis"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
