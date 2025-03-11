require "test_helper"

class ClientBookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get client_bookings_index_url
    assert_response :success
  end
end
