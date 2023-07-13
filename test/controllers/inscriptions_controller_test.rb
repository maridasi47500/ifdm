require 'test_helper'

class InscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inscriptions_index_url
    assert_response :success
  end

end
