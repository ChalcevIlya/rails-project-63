# frozen_string_literal: true

require "test_helper"

# Tests for form generator
class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_that_it_generate_form_tag
    user_class = Struct.new(:name, :job, keyword_init: true)
    user = user_class.new name: "rob"

    assert (HexletCode.form_for user, class: "hexlet-form") == '<form action="#" method="post" class="hexlet-form"></form>'
    assert (HexletCode.form_for user) == '<form action="#" method="post"></form>'
    assert (HexletCode.form_for user, url: "/profile", class: "hexlet-form") == '<form action="/profile" method="post" class="hexlet-form"></form>'
  end
end
