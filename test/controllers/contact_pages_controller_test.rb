require "test_helper"

class ContactPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contact_pages_index_url
    assert_response :success
  end
end
