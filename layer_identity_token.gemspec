# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'layer/identity_token'

Gem::Specification.new do |spec|
  spec.name          = "Layer::IdentityToken"
  spec.version       = Layer::IdentityToken::VERSION
  spec.authors       = ["we5"]
  spec.email         = ["bjoern@we5.de"]
  spec.description   = %q{Simple model for creating a IdentityToken based on JWT for Layer integration}
  spec.summary       = %q{Simple model for creating a IdentityToken based on JWT for Layer integration}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"

  spec.add_dependency "jwt", "~> 1.4.1"
end
