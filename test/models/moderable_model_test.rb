require 'test_helper'

class ModerableModelTest < ActiveSupport::TestCase
  test "should should'nt save with out is_accepted attribut" do
    moderable = ModerableModel.create(content: 'Bonjour je suis très heureux')

    refute moderable.valid?
  end

  test "should should'nt save with out content attribut" do
    moderable = ModerableModel.create(is_accepted: false)

    refute moderable.valid?
  end
end
