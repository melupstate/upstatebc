require "test_helper"

class AboutPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get about_pages_index_url
    assert_response :success
  end
end
