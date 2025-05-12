# frozen_string_literal: true

module HexletCode
  # FormBuilder - для создания стейта формы
  class FormBuilder
    attr_accessor :form_state
    attr_reader :record

    def initialize(record, **attributes)
      @record = record
      @form_state = [{ tag_name: 'form', action: attributes.fetch(:url, '#'),
                       method: 'post' }.merge(attributes.except(:url))]
    end

    def input(field, **attributes)
      field_name = field.to_s
      value = record.public_send(field)

      case attributes.delete(:as)
      when :text
        @form_state.push({ tag_name: 'textarea', inside_value: value, name: field_name, cols: 20,
                           rows: 40 }.merge(attributes))
      else
        @form_state.push({ tag_name: 'input', name: field_name, type: 'text', value: value }.merge(attributes))
      end
    end

    def submit(button_text = 'Save', **attributes)
      @form_state.push({ tag_name: 'input', type: 'submit', value: button_text }.merge(attributes))
    end
  end
end
