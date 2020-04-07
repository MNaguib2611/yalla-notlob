require 'test_helper'

class UserJoinOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_join_orders_index_url
    assert_response :success
  end

  test "should get create" do
    get user_join_orders_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_join_orders_destroy_url
    assert_response :success
  end

  test "should get new" do
    get user_join_orders_new_url
    assert_response :success
  end

  test "should get show" do
    get user_join_orders_show_url
    assert_response :success
  end

end
