require 'test_helper'

class StopControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get stop_create_url
    assert_response :success
  end

end
