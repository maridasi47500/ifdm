require 'test_helper'

class AchatsControllerTest < ActionDispatch::IntegrationTest
  test "should get cours" do
    get achats_cours_url
    assert_response :success
  end

end
