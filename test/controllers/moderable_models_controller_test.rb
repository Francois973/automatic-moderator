require 'test_helper'

class ModerableModelsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get '/moderable_models'
    assert_response :success
  end

  test 'should get new' do
    get '/moderable_models/new'
    assert_response :success
  end
end
