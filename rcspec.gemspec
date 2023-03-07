# frozen_string_literal: true

require_relative "lib/rcspec/version"

Gem::Specification.new do |spec|
  spec.name          = "rcspec"
  spec.version       = RCSpec::VERSION
  spec.authors       = ["connorryanbaker"]
  spec.email         = ["connorbaker@gmail.com"]

  spec.summary       = "The RC Cola of testing libraries. A knockoff rspec built for educational purposes."
  spec.homepage      = "https://github.com/connorryanbaker/rcspec"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/connorryanbaker/rcspec"
  spec.metadata["changelog_uri"] = "https://github.com/connorryanbaker/rcspec/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir = "bin"
  spec.executables << "rcspec"
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_development_dependency "pry", "~> 0.14.2"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "rubocop", "~> 1.4"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
