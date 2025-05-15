# frozen_string_literal: true

module HexletCode
  module Inputs
    # SubmitInput - класс для рендера submit инпута
    class SubmitInput < BaseInput
      def render
        "#{tag_render}#{Tag.build('input', type: 'submit', value: input_hash[:value], **input_hash[:attributes])}"
      end
    end
  end
end
