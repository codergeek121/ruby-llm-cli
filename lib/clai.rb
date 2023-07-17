# frozen_string_literal: true

require "thor"
require "http"
require "zeitwerk"
require "debug"
require "fileutils"
require "yaml"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect(
  "clai"   => "CLAI",
  "http_client" => "HTTPClient",
  "cli" => "CLI",
)
loader.setup

module CLAI
  class Error < StandardError; end
  class APIKeyMissing < Error; end

  @@config_file_path = File.expand_path("~/.config/clai/clai.yml")
  def self.config_file_path
    @@config_file_path
  end

  @@strings = YAML.safe_load_file(File.expand_path("../strings/strings.yml", __FILE__))
  def self.strings
    @@strings
  end
  S = ->(name) { @@strings.fetch(name.to_s) { raise "Unknown translation! Please file a bug!" } }
end

loader.eager_load
