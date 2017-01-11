require 'test_helper'

class LikeListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like_list = like_lists(:one)
  end

  test "should get index" do
    get like_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_like_list_url
    assert_response :success
  end

  test "should create like_list" do
    assert_difference('LikeList.count') do
      post like_lists_url, params: { like_list: { shout_id: @like_list.shout_id, user_id: @like_list.user_id } }
    end

    assert_redirected_to like_list_url(LikeList.last)
  end

  test "should show like_list" do
    get like_list_url(@like_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_like_list_url(@like_list)
    assert_response :success
  end

  test "should update like_list" do
    patch like_list_url(@like_list), params: { like_list: { shout_id: @like_list.shout_id, user_id: @like_list.user_id } }
    assert_redirected_to like_list_url(@like_list)
  end

  test "should destroy like_list" do
    assert_difference('LikeList.count', -1) do
      delete like_list_url(@like_list)
    end

    assert_redirected_to like_lists_url
  end
end
