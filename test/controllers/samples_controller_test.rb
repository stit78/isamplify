require 'test_helper'

class SamplesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get samples_index_url
    assert_response :success
  end

  test "should get new" do
    get samples_new_url
    assert_response :success
  end

  test "should get create" do
    get samples_create_url
    assert_response :success
  end

end
