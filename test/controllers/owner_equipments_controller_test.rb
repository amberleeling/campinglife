require "test_helper"

class OwnerEquipmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get owner_equipments_index_url
    assert_response :success
  end
end
