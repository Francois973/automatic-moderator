require 'test_helper'

class ModerableModelTest < ActiveSupport::TestCase
  test 'should have content attribut' do
    moderable = ModerableModel.create(is_accepted: false)

    refute moderable.valid?
  end

  test 'should accept content' do
    moderable = ModerableModel.create(is_accepted: false,
                                      content: "Bonjour je suis très heureux, c'est vraiment trop gentil ce que tu fais pour moi")

    assert_equal true, moderable.is_accepted
  end

  test 'should not accept content' do
    moderable = ModerableModel.create(is_accepted: false,
                                      content: "Tu es un connard, c'est vraiment pas sympa")

    assert_equal false, moderable.is_accepted
  end

  test 'should find attributes' do
    moderable = Post.create(is_accepted: false,
                            body: "Bonjour je suis très heureux, c'est vraiment trop gentil ce que tu fais pour moi")

    assert_equal %i[body], moderable.class.attribute_names
  end

  test 'should find value of attributes' do
    moderable = Post.create(is_accepted: false,
                            body: 'Bonjour je suis très heureux')

    assert_equal 'Bonjour je suis très heureux', moderable.format_string_with_attributes
  end
end
