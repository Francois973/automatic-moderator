require 'test_helper'

class ModerableTest < ActiveSupport::TestCase
  test 'should have is_accepted attribut' do
    moderable = Moderable.create

    refute moderable.valid?
  end
end
