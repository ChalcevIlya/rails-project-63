# frozen_string_literal: true

autoload(:Tag, 'tag.rb')

# Field generator
module FormBuilder
  def self.input(field, **attributes)
    temp_hash = {}
    field_name = field.to_s
    temp_hash[:name] = field_name
    value = @structure.public_send(field)
    @result += Tag.build('label', for: field_name) { field_name.capitalize }
    case attributes.delete(:as)
    when :text
      temp_hash.merge!({ cols: attributes.include?(:cols) ? attributes.delete(:cols) : '20',
                         rows: attributes.include?(:rows) ? attributes.delete(:rows) : '40' })
      @result += Tag.build('textarea', **temp_hash, **attributes) { value }
    else
      @result += Tag.build('input', **temp_hash, type: 'text', value: value, **attributes)
    end
  end

  def self.submit(button_text = 'Save')
    @result += Tag.build('input', type: 'submit', value: button_text)
  end
end
