# frozen_string_literal: true

module HexletCode
  # FormBuilder - для создания стейта формы
  class FormBuilder
    attr_accessor :form_state, :form_attrs
    attr_reader :record

    def initialize(record, **attributes)
      @record = record
      @form_attrs = { tag_name: 'form', action: attributes.fetch(:url, '#'),
                      method: 'post' }.merge(attributes.except(:url))
      @form_state = []
    end

    def input(field, **attributes)
      value = record.public_send(field)
      input_type = attributes.delete(:as) || :default

      element = { input_type:, value:, name: field.to_s, attributes: }
      @form_state << element
    end

    def submit(button_text = 'Save', **attributes)
      @form_state.push({ input_type: 'submit', value: button_text, attributes: })
    end
  end
end
