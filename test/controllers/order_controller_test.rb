require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest
  test "should get myorder" do
    get order_myorder_url
    assert_response :success
  end

end
