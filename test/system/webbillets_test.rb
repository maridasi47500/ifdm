require "application_system_test_case"

class WebbilletsTest < ApplicationSystemTestCase
  setup do
    @webbillet = webbillets(:one)
  end

  test "visiting the index" do
    visit webbillets_url
    assert_selector "h1", text: "Webbillets"
  end

  test "creating a Webbillet" do
    visit webbillets_url
    click_on "New Webbillet"

    fill_in "Flyer", with: @webbillet.flyer
    fill_in "Title", with: @webbillet.title
    fill_in "Url", with: @webbillet.url
    click_on "Create Webbillet"

    assert_text "Webbillet was successfully created"
    click_on "Back"
  end

  test "updating a Webbillet" do
    visit webbillets_url
    click_on "Edit", match: :first

    fill_in "Flyer", with: @webbillet.flyer
    fill_in "Title", with: @webbillet.title
    fill_in "Url", with: @webbillet.url
    click_on "Update Webbillet"

    assert_text "Webbillet was successfully updated"
    click_on "Back"
  end

  test "destroying a Webbillet" do
    visit webbillets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Webbillet was successfully destroyed"
  end
end
