require 'test_helper'

class WebbilletsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @webbillet = webbillets(:one)
  end

  test "should get index" do
    get webbillets_url
    assert_response :success
  end

  test "should get new" do
    get new_webbillet_url
    assert_response :success
  end

  test "should create webbillet" do
    assert_difference('Webbillet.count') do
      post webbillets_url, params: { webbillet: { flyer: @webbillet.flyer, title: @webbillet.title, url: @webbillet.url } }
    end

    assert_redirected_to webbillet_url(Webbillet.last)
  end

  test "should show webbillet" do
    get webbillet_url(@webbillet)
    assert_response :success
  end

  test "should get edit" do
    get edit_webbillet_url(@webbillet)
    assert_response :success
  end

  test "should update webbillet" do
    patch webbillet_url(@webbillet), params: { webbillet: { flyer: @webbillet.flyer, title: @webbillet.title, url: @webbillet.url } }
    assert_redirected_to webbillet_url(@webbillet)
  end

  test "should destroy webbillet" do
    assert_difference('Webbillet.count', -1) do
      delete webbillet_url(@webbillet)
    end

    assert_redirected_to webbillets_url
  end
end
