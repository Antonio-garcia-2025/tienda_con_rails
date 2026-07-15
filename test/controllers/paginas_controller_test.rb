require "test_helper"

class PaginasControllerTest < ActionDispatch::IntegrationTest
  test "should get principal" do
    get paginas_principal_url
    assert_response :success
  end
end
