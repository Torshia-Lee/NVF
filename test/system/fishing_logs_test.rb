require "application_system_test_case"

class FishingLogsTest < ApplicationSystemTestCase
  setup do
    @fishing_log = fishing_logs(:one)
  end

  test "visiting the index" do
    visit fishing_logs_url
    assert_selector "h1", text: "Fishing logs"
  end

  test "should create fishing log" do
    visit fishing_logs_url
    click_on "New fishing log"

    fill_in "Date", with: @fishing_log.date
    fill_in "Lake", with: @fishing_log.lake_id
    fill_in "Lures", with: @fishing_log.lures
    fill_in "Notes", with: @fishing_log.notes
    fill_in "Photo", with: @fishing_log.photo
    fill_in "Species", with: @fishing_log.species
    fill_in "User", with: @fishing_log.user_id
    click_on "Create Fishing log"

    assert_text "Fishing log was successfully created"
    click_on "Back"
  end

  test "should update Fishing log" do
    visit fishing_log_url(@fishing_log)
    click_on "Edit this fishing log", match: :first

    fill_in "Date", with: @fishing_log.date
    fill_in "Lake", with: @fishing_log.lake_id
    fill_in "Lures", with: @fishing_log.lures
    fill_in "Notes", with: @fishing_log.notes
    fill_in "Photo", with: @fishing_log.photo
    fill_in "Species", with: @fishing_log.species
    fill_in "User", with: @fishing_log.user_id
    click_on "Update Fishing log"

    assert_text "Fishing log was successfully updated"
    click_on "Back"
  end

  test "should destroy Fishing log" do
    visit fishing_log_url(@fishing_log)
    click_on "Destroy this fishing log", match: :first

    assert_text "Fishing log was successfully destroyed"
  end
end
