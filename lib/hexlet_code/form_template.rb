# frozen_string_literal: true

module HexletCode
  # FormTemplate - рендерер стейта формы
  class FormTemplate
    def self.render(builder)
      tags = builder.form_state.map do |element|
        klass = HexletCode::Inputs.const_get("#{element[:input_type].capitalize}Input")
        element = klass.new(element)
        element.render
      end

      Tag.build(builder.form_attrs.delete(:tag_name), **builder.form_attrs) { tags.join }
    end
  end
end
