require 'test_helper'

class FollowListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @follow_list = follow_lists(:one)
  end

  test "should get index" do
    get follow_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_follow_list_url
    assert_response :success
  end

  test "should create follow_list" do
    assert_difference('FollowList.count') do
      post follow_lists_url, params: { follow_list: { follow_id: @follow_list.follow_id, user_id: @follow_list.user_id } }
    end

    assert_redirected_to follow_list_url(FollowList.last)
  end

  test "should show follow_list" do
    get follow_list_url(@follow_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_follow_list_url(@follow_list)
    assert_response :success
  end

  test "should update follow_list" do
    patch follow_list_url(@follow_list), params: { follow_list: { follow_id: @follow_list.follow_id, user_id: @follow_list.user_id } }
    assert_redirected_to follow_list_url(@follow_list)
  end

  test "should destroy follow_list" do
    assert_difference('FollowList.count', -1) do
      delete follow_list_url(@follow_list)
    end

    assert_redirected_to follow_lists_url
  end
end
