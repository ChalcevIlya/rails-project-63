# frozen_string_literal: true

require_relative "hexlet_code/version"

# Main module
module HexletCode
  class Error < StandardError; end
  autoload(:Tag, "./tag.rb")
end
