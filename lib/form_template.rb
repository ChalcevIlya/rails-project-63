# frozen_string_literal: true

module HexletCode
  # FormTemplate - рендерер стейта формы
  class FormTemplate
    def self.render(form)
      main_tag = form.delete_at 0
      tags = form.map do |element|
        tag_render = ''
        next if element[:tag_name] == 'form'

        unless element[:type] == 'submit'
          tag_render += Tag.build('label', for: element[:name]) do
            element[:name]&.capitalize
          end
        end
        "#{tag_render}#{Tag.build(element[:tag_name], **element.except(:tag_name, :inside_value)) do
          element[:inside_value]
        end}"
      end

      Tag.build(main_tag.delete(:tag_name), **main_tag) { tags.join }
    end
  end
end
