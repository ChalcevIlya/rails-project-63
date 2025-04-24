# frozen_string_literal: true

require_relative "hexlet_code/version"

# Main module
module HexletCode
  class Error < StandardError; end
  autoload(:Tag, "/home/broccolya/Projects/rails-project-63/lib/tag.rb")

  def self.form_for(structure, **attributes)
    @result = ""
    attributes = { action: attributes.include?(:url) ? attributes.delete(:url) : "#", method: "post" }.merge!(attributes)
    @result += Tag.build("form", **attributes)
    if block_given?
      @structure = structure
      yield(self)
    end
    "#{@result}</form>"
  end

  def self.input(field, **attributes)
    temp_hash = {}
    temp_hash[:name] = field.to_s
    value = @structure.public_send(field)
    case attributes.delete(:as)
    when :text
      temp_hash.merge!({ cols: attributes.include?(:cols) ? attributes.delete(:cols) : "20",
                         rows: attributes.include?(:rows) ? attributes.delete(:rows) : "40" })
      temp_hash.merge!(attributes)
      @result += Tag.build("textarea", **temp_hash) { value }
    else
      temp_hash.merge!({ type: "text", value: value })
      temp_hash.merge!(attributes)
      @result += Tag.build("input", **temp_hash)
    end
  end
end
