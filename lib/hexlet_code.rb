# frozen_string_literal: true

require_relative 'hexlet_code/version'
# Main module
module HexletCode
  autoload(:Tag, 'tag.rb')
  autoload(:FormBuilder, 'form_builder.rb')
  autoload(:FormTemplate, 'form_template.rb')

  def self.form_for(record, **attributes)
    builder = FormBuilder.new(record, **attributes)
    yield builder if block_given?
    FormTemplate.render(builder.form_state)
  end
end
