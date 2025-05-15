# frozen_string_literal: true

module HexletCode
  module Inputs
    # BaseInput - базовый класс инпута
    class BaseInput
      attr_accessor :tag_render
      attr_reader :input_hash

      def initialize(input_hash)
        @input_hash = input_hash
        @tag_render = ''
      end

      def render
        @tag_render += Tag.build('label', for: input_hash[:name]) do
          input_hash[:name]&.capitalize
        end
      end
    end
  end
end
