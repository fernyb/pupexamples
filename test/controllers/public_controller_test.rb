require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get slow_ajax" do
    get public_slow_ajax_url
    assert_response :success
  end

end
