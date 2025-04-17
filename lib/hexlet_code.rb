# frozen_string_literal: true

require_relative "hexlet_code/version"

# Main module
module HexletCode
  class Error < StandardError; end
  autoload(:Tag, "/home/broccolya/Projects/rails-project-63/lib/tag.rb")

  def self.form_for(_name, **attributes)
    temp_hash = {}
    temp_hash[:action] = attributes.include?(:url) ? attributes.delete(:url) : "#"
    temp_hash[:method] = "post"
    attributes = temp_hash.merge!(attributes)
    Tag.build("form", **attributes) {}
  end
end
