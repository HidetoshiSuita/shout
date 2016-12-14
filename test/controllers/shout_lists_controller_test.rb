require 'test_helper'

class ShoutListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shout_list = shout_lists(:one)
  end

  test "should get index" do
    get shout_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_shout_list_url
    assert_response :success
  end

  test "should create shout_list" do
    assert_difference('ShoutList.count') do
      post shout_lists_url, params: { shout_list: { shout: @shout_list.shout, user_id: @shout_list.user_id } }
    end

    assert_redirected_to shout_list_url(ShoutList.last)
  end

  test "should show shout_list" do
    get shout_list_url(@shout_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_shout_list_url(@shout_list)
    assert_response :success
  end

  test "should update shout_list" do
    patch shout_list_url(@shout_list), params: { shout_list: { shout: @shout_list.shout, user_id: @shout_list.user_id } }
    assert_redirected_to shout_list_url(@shout_list)
  end

  test "should destroy shout_list" do
    assert_difference('ShoutList.count', -1) do
      delete shout_list_url(@shout_list)
    end

    assert_redirected_to shout_lists_url
  end
end
