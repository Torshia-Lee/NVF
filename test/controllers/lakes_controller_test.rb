require "test_helper"

class LakesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lake = lakes(:one)
  end

  test "should get index" do
    get lakes_url
    assert_response :success
  end

  test "should get new" do
    get new_lake_url
    assert_response :success
  end

  test "should create lake" do
    assert_difference("Lake.count") do
      post lakes_url, params: { lake: { description: @lake.description, name: @lake.name } }
    end

    assert_redirected_to lake_url(Lake.last)
  end

  test "should show lake" do
    get lake_url(@lake)
    assert_response :success
  end

  test "should get edit" do
    get edit_lake_url(@lake)
    assert_response :success
  end

  test "should update lake" do
    patch lake_url(@lake), params: { lake: { description: @lake.description, name: @lake.name } }
    assert_redirected_to lake_url(@lake)
  end

  test "should destroy lake" do
    assert_difference("Lake.count", -1) do
      delete lake_url(@lake)
    end

    assert_redirected_to lakes_url
  end
end
