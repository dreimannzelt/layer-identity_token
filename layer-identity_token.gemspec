# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'layer/identity_token/version'

Gem::Specification.new do |spec|
  spec.name          = "layer-identity_token"
  spec.version       = Layer::IdentityToken::VERSION
  spec.authors       = ['we5']
  spec.email         = ['bjoern@we5.de']
  spec.description   = %q{Simple class for creating an IdentityToken and authenticating Layer clients}
  spec.summary       = %q{IdentityToken for Layer clients}
  spec.homepage      = 'http://github.com/dreimannzelt/layer-identity_token'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 13'
  spec.add_development_dependency 'pry', '~> 0'

  spec.add_dependency 'jwt', '~> 2.2', '>= 1.4.1'
end
