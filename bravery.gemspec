# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bravery/version'

Gem::Specification.new do |spec|
  spec.name          = "bravery"
  spec.version       = Bravery::VERSION
  spec.authors       = ["Rick Carlino"]
  spec.email         = ["rick.carlino@gmail.com"]
  spec.description   = "Ruby state machine micro library"
  spec.summary       = "Ruby state machine micro library"
  spec.homepage      = "http://github.com/rickcarlino/bravery"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
