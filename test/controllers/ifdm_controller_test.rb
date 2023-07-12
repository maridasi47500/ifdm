require 'test_helper'

class IfdmControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ifdm_index_url
    assert_response :success
  end

end
