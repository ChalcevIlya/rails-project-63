# frozen_string_literal: true

module HexletCode
  module Inputs
    # DefaultInput - класс для рендера стандартного инпута
    class DefaultInput < BaseInput
      def render
        super
        "#{tag_render}#{Tag.build('input', name: input_hash[:name], type: 'text', value: input_hash[:value],
                                           **input_hash[:attributes])}"
      end
    end
  end
end
