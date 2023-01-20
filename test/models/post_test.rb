require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'should have a body' do
    post = Post.create

    refute post.valid?
  end
end
