require "test_helper"

class StoreOwnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test "should get index" do
    get store_owners_url
    assert_response :success
  end

  test "should get new" do
    get new_store_owner_url
    assert_response :success
  end

  test "should get create" do
    post store_owners_url, params: { user: { email: 'new_store_owner@example.com', password: 'password', password_confirmation: 'password' } }
    assert_redirected_to store_owners_path
  end
end
