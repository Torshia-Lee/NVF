require "application_system_test_case"

class LakesTest < ApplicationSystemTestCase
  setup do
    @lake = lakes(:one)
  end

  test "visiting the index" do
    visit lakes_url
    assert_selector "h1", text: "Lakes"
  end

  test "should create lake" do
    visit lakes_url
    click_on "New lake"

    fill_in "Description", with: @lake.description
    fill_in "Name", with: @lake.name
    click_on "Create Lake"

    assert_text "Lake was successfully created"
    click_on "Back"
  end

  test "should update Lake" do
    visit lake_url(@lake)
    click_on "Edit this lake", match: :first

    fill_in "Description", with: @lake.description
    fill_in "Name", with: @lake.name
    click_on "Update Lake"

    assert_text "Lake was successfully updated"
    click_on "Back"
  end

  test "should destroy Lake" do
    visit lake_url(@lake)
    click_on "Destroy this lake", match: :first

    assert_text "Lake was successfully destroyed"
  end
end
