require 'test_helper'

class MarkersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get markers_show_url
    assert_response :success
  end

  test "should get index" do
    get markers_index_url
    assert_response :success
  end

end
