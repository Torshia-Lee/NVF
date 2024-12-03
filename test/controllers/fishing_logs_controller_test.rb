require "test_helper"

class FishingLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fishing_log = fishing_logs(:one)
  end

  test "should get index" do
    get fishing_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_fishing_log_url
    assert_response :success
  end

  test "should create fishing_log" do
    assert_difference("FishingLog.count") do
      post fishing_logs_url, params: { fishing_log: { date: @fishing_log.date, lake_id: @fishing_log.lake_id, lures: @fishing_log.lures, notes: @fishing_log.notes, photo: @fishing_log.photo, species: @fishing_log.species, user_id: @fishing_log.user_id } }
    end

    assert_redirected_to fishing_log_url(FishingLog.last)
  end

  test "should show fishing_log" do
    get fishing_log_url(@fishing_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_fishing_log_url(@fishing_log)
    assert_response :success
  end

  test "should update fishing_log" do
    patch fishing_log_url(@fishing_log), params: { fishing_log: { date: @fishing_log.date, lake_id: @fishing_log.lake_id, lures: @fishing_log.lures, notes: @fishing_log.notes, photo: @fishing_log.photo, species: @fishing_log.species, user_id: @fishing_log.user_id } }
    assert_redirected_to fishing_log_url(@fishing_log)
  end

  test "should destroy fishing_log" do
    assert_difference("FishingLog.count", -1) do
      delete fishing_log_url(@fishing_log)
    end

    assert_redirected_to fishing_logs_url
  end
end
