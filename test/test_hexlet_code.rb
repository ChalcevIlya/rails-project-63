# frozen_string_literal: true

require 'test_helper'

# Tests for form generator
class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_that_it_generate_form_tag
    user = User.new name: 'rob'

    result = HexletCode.form_for user, class: 'hexlet-form'
    assert_equal '<form action="#" method="post" class="hexlet-form"></form>', result

    result = HexletCode.form_for user
    assert_equal '<form action="#" method="post"></form>', result

    result = HexletCode.form_for user, url: '/profile', class: 'hexlet-form'
    assert_equal '<form action="/profile" method="post" class="hexlet-form"></form>', result
  end

  def test_generating_full_form_without_additional_attrs
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    path = 'test/fixtures/from_tag_without_additional_attrs.html'
    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert_equal File.read(path), result
  end

  def test_generating_full_form_with_attrs
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    path = 'test/fixtures/form_tag_with_attrs.html'
    result = HexletCode.form_for user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end
    assert_equal File.read(path), result
  end

  def test_generating_full_form_with_overriding_attrs
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    path = 'test/fixtures/form_tag_with_overriding_attrs.html'
    result = HexletCode.form_for user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    assert_equal File.read(path), result
  end

  def test_submit
    user = User.new job: 'hexlet'

    path = 'test/fixtures/form_with_submit.html'
    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert_equal File.read(path), result
  end

  def test_submit_override
    user = User.new job: 'hexlet'

    path = 'test/fixtures/form_with_submit_override.html'
    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end
    assert_equal File.read(path), result
  end
end
