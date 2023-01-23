require 'test_helper'

class ModerableModelTest < ActiveSupport::TestCase
  # test 'should have is_accepted attribut' do
  #   moderable = ModerableModel.create(content: 'Bonjour je suis très heureux')

  #   refute moderable.valid?
  # end

  # test 'should have content attribut' do
  #   moderable = ModerableModel.create(is_accepted: false)

  #   refute moderable.valid?
  # end

  test 'should accept content' do
    moderable = ModerableModel.create(is_accepted: false,
                                      content: "Bonjour je suis très heureux, c'est vraiment trop gentil ce que tu fais pour moi")

    assert_equal true, moderable.is_accepted
  end
end
