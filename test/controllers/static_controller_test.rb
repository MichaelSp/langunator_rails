require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get listing" do
    get :listing
    assert_response :success
  end

end
