require 'test_helper'

class Frequencia::AdminsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
