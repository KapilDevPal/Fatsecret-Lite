# frozen_string_literal: true

require_relative "lib/fatsecret_lite/version"

Gem::Specification.new do |spec|
  spec.name = "fatsecret_lite"
  spec.version = FatsecretLite::VERSION
  spec.authors = ["KapilDevPal"]
  spec.email = ["dev.kapildevpal@gmail.com"]

  spec.summary     = "A lightweight Ruby gem for interacting with the FatSecret API"
  spec.description = "This gem provides a simple interface to interact with the FatSecret API using OAuth2 and RestClient."
  spec.homepage    = "https://github.com/KapilDevPal/fatsecret_lite"
  spec.license     = "MIT"
  spec.required_ruby_version = ">= 2.5" # Define minimum Ruby version

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/KapilDevPal/fatsecret_lite"
  spec.metadata["changelog_uri"] = "https://github.com/KapilDevPal/fatsecret_lite/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.require_paths = ["lib"]

  # Add dependencies for your gem
  spec.add_dependency "oauth2", "~> 1.4"
  spec.add_dependency "rest-client", "~> 2.1"
  spec.add_dependency "json"

  # No executable files to include
  spec.bindir        = "bin"
  spec.executables = []
end
