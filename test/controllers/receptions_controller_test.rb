require 'test_helper'

class ReceptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get receptions_index_url
    assert_response :success
  end

  test "should get new" do
    get receptions_new_url
    assert_response :success
  end

  test "should get create" do
    get receptions_create_url
    assert_response :success
  end

  test "should get edit" do
    get receptions_edit_url
    assert_response :success
  end

  test "should get update" do
    get receptions_update_url
    assert_response :success
  end

end
