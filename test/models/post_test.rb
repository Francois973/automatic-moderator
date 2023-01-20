require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'should have a body' do
    post = Post.create(is_accepted: false)

    refute post.valid?
  end

  test 'should shave is_accepted attribut' do
    post = Post.create(body: 'Bonjour je suis très heureux')

    refute post.valid?
  end
end
