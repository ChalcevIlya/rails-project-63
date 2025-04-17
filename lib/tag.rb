# frozen_string_literal: true

# Tag generator
module Tag
  def self.build(name, **attributes)
    return block_given? ? "<#{name}></#{name}>" : "<#{name}>" if attributes.empty?

    construct_array = []
    attributes.each_pair { |key, value| construct_array.push("#{key}=\"#{value}\"") }
    return "<#{name} #{construct_array.join(" ")}>" unless block_given?

    "<#{name} #{construct_array.join(" ")}>#{yield}</#{name}>"
  end
end
