# frozen_string_literal: true

module Tag
  def self.build (name, **attributes)
    return "<" + name.to_s + ">" if attributes.empty?
    construct_array = []
    attributes.each_pair {|key, value| construct_array.push(key.to_s + "=\"" + value + "\"")}
    result = "<" + name.to_s + " " + construct_array.join(" ") + ">"
    result
  end
end