require "test_helper"

class ModerableModelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get moderable_models_index_url
    assert_response :success
  end

  test "should get new" do
    get moderable_models_new_url
    assert_response :success
  end

  test "should get create" do
    get moderable_models_create_url
    assert_response :success
  end
end
