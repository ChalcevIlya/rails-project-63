# frozen_string_literal: true

# Tag generator
module Tag
  def self.build(name, **attributes)
    return "<#{name}>" if attributes.empty?

    construct_array = []
    attributes.each_pair { |key, value| construct_array.push("#{key}=\"#{value}\"") }
    "<#{name} #{construct_array.join(" ")}>"
  end
end
