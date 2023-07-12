require 'test_helper'

class InternshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get internships_index_url
    assert_response :success
  end

end
