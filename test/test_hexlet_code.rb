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

  def test_generating_full_form_without_additional_attrs
    user_class = Struct.new(:name, :job, :gender, keyword_init: true)
    user = user_class.new name: "rob", job: "hexlet", gender: "m"

    file = File.open("test/from_tag_without_additional_attrs.html")
    assert (HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end) == file.read
    file.close
  end

  def test_generating_full_form_with_attrs
    user_class = Struct.new(:name, :job, :gender, keyword_init: true)
    user = user_class.new name: "rob", job: "hexlet", gender: "m"

    file = File.open("test/form_tag_with_attrs.html")
    assert (HexletCode.form_for user, url: "#" do |f|
      f.input :name, class: "user-input"
      f.input :job
    end) == file.read
    file.close
  end

  def test_generating_full_form_with_overriding_attrs
    user_class = Struct.new(:name, :job, :gender, keyword_init: true)
    user = user_class.new name: "rob", job: "hexlet", gender: "m"

    file = File.open("test/form_tag_with_overriding_attrs.html")
    assert (HexletCode.form_for user, url: "#" do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end) == file.read
    file.close
  end
end
