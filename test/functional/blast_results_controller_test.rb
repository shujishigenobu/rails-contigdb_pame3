require 'test_helper'

class BlastResultsControllerTest < ActionController::TestCase
  test "should get plain" do
    get :plain
    assert_response :success
  end

end
