require "test_helper"

class ExportUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get export_users_index_url
    assert_response :success
  end
end
