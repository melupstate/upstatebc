require "test_helper"

class PartnerPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get partner_pages_index_url
    assert_response :success
  end
end
