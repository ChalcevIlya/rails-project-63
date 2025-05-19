# frozen_string_literal: true

module HexletCode
  module Inputs
    # TextInput - класс для рендера textarea инпута
    class TextInput < BaseInput
      def render
        "#{label}#{Tag.build('textarea', name: input_hash[:name], cols: 20, rows: 40, **input_hash[:attributes]) do
          input_hash[:value]
        end}"
      end
    end
  end
end
