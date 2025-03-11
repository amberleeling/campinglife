require "test_helper"

class Client::BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get client_bookings_index_url
    assert_response :success
  end
end
