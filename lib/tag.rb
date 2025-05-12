# frozen_string_literal: true

# Tag generator
module Tag
  NO_PAIR_TAGS = %w[area base basefont bgsound br col command embed hr img input
                    isindex keygen link meta param source track wbr form].freeze

  def self.build(name, **attributes)
    attributes_line = attributes.map { |key, value| " #{key}=\"#{value}\"" }.join
    return "<#{name}#{attributes_line}>" if NO_PAIR_TAGS.include?(name)

    "<#{name}#{attributes_line}>#{yield}</#{name}>"
  end
end
