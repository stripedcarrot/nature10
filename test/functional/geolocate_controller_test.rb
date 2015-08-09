require 'test_helper'

class GeolocateControllerTest < ActionController::TestCase
  test "should get locationmap" do
    get :locationmap
    assert_response :success
  end

end
