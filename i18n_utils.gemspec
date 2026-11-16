# frozen_string_literal: true

require_relative "lib/i18n_utils/version"

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

  spec.add_dependency "i18n"
  spec.add_dependency "activesupport"
end
