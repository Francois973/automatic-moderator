require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'should have a body' do
    post = Post.create(is_accepted: false)

    refute post.valid?
  end

  test 'should accept body' do
    post = Post.create(is_accepted: false,
                       body: "Bonjour je suis très heureux, c'est vraiment trop gentil ce que tu fais pour moi")
    assert_equal true, post.is_accepted
  end

  test 'should not accept body' do
    post = Post.create(is_accepted: false,
                       body: "Tu es un connard, c'est vraiment pas sympa")

    assert_equal false, post.is_accepted
  end

  test 'should find attributes' do
    post = Post.create(is_accepted: false,
                       body: "Bonjour je suis très heureux, c'est vraiment trop gentil ce que tu fais pour moi")

    assert_equal %i[body], post.class.attribute_names
  end

  test 'should find value of attributes' do
    post = Post.create(is_accepted: false,
                       body: 'Bonjour je suis très heureux')

    assert_equal 'Bonjour je suis très heureux', post.format_string_with_attributes
  end
end
