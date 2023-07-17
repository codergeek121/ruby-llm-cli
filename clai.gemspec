# frozen_string_literal: true

require_relative "lib/clai/version"

Gem::Specification.new do |spec|
  spec.name = "clai"
  spec.version = CLAI::VERSION
  spec.authors = ["Niklas Häusele"]
  spec.email = ["niklas.haeusele@hey.com"]

  spec.summary = "Your personal AI for the terminal"
  spec.description = spec.summary
  spec.homepage = "https://github.com/codergeek121/clai"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "zeitwerk", '~> 2.6', '>= 2.6.8'
  spec.add_dependency "http", '~> 5.1', '>= 5.1.1'
  spec.add_dependency "thor", '~> 1.2', '>= 1.2.2'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.post_install_message = <<~POST_INSTALL
      _____ _               _____ 
     / ____| |        /\   |_   _|
    | |    | |       /  \    | |  
    | |    | |      / /\ \   | |  
    | |____| |____ / ____ \ _| |_ 
     \_____|______/_/    \_\_____|
                               
    Thank you for using clai.

    clai is early alpha software, beware of unexpected costs.
    Make sure to add a billing limit to your OpenAI api key.

    To start using clai, run 'clai setup'
  POST_INSTALL
end
