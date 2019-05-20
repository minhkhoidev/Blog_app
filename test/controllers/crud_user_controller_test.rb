require 'test_helper'

class CrudUserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get crud_user_index_url
    assert_response :success
  end

  test "should get show" do
    get crud_user_show_url
    assert_response :success
  end

end
