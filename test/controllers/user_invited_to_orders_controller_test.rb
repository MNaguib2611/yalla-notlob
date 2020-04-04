require 'test_helper'

class UserInvitedToOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_invited_to_orders_index_url
    assert_response :success
  end

  test "should get destroy" do
    get user_invited_to_orders_destroy_url
    assert_response :success
  end

end
