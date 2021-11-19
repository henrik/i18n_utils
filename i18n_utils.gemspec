# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'i18n_utils/version'

Gem::Specification.new do |spec|
  spec.name          = "i18n_utils"
  spec.version       = I18nUtils::VERSION
  spec.authors       = ["Henrik Nyh"]
  spec.email         = ["henrik@nyh.se"]
  spec.summary       = "I18n utilities for Ruby on Rails."
  spec.homepage      = "https://github.com/henrik/i18n_utils"
  spec.license       = "MIT"
  spec.metadata      = { "rubygems_mfa_required" => "true" }

  spec.files         = Dir["lib/**/*"] + ["README.md", "LICENSE.txt"]
  spec.executables   = []
  spec.test_files    = Dir["spec/**/*"]
  spec.require_paths = ["lib"]

  spec.add_dependency "i18n"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
