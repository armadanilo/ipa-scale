# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/ipa_scale/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-ipa_scale'
  spec.version       = Fastlane::IpaScale::VERSION
  spec.author        = 'Danilo Caetano'
  spec.email         = 'uiguigo@gmail.com'

  spec.summary       = '"Checks the size of your built .ipa and warns you if you you are near the given threshold."'
  spec.homepage      = "https://github.com/UIGuigo/ipa_scale"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # Don't add a dependency to fastlane or fastlane_re
  # since this would cause a circular dependency

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'fastlane', '>= 2.54.2'
end
