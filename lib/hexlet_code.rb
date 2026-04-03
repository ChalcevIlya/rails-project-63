# frozen_string_literal: true

require_relative 'hexlet_code/version'
# Main module
module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:FormTemplate, 'hexlet_code/form_template.rb')
  autoload(:Inputs, 'hexlet_code/inputs.rb')

  def self.form_for(record, **attributes)
    builder = FormBuilder.new(record, **attributes)
    yield builder if block_given?
    FormTemplate.render(builder)
  end
end
