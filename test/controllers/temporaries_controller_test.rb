require "test_helper"

class TemporariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temporary = temporaries(:one)
  end

  test "should get index" do
    get temporaries_url
    assert_response :success
  end

  test "should get new" do
    get new_temporary_url
    assert_response :success
  end

  test "should create temporary" do
    assert_difference("Temporary.count") do
      post temporaries_url, params: { temporary: { a: @temporary.a, anylike: @temporary.anylike, b: @temporary.b, c: @temporary.c, d: @temporary.d, dontlike: @temporary.dontlike, e: @temporary.e } }
    end

    assert_redirected_to temporary_url(Temporary.last)
  end

  test "should show temporary" do
    get temporary_url(@temporary)
    assert_response :success
  end

  test "should get edit" do
    get edit_temporary_url(@temporary)
    assert_response :success
  end

  test "should update temporary" do
    patch temporary_url(@temporary), params: { temporary: { a: @temporary.a, anylike: @temporary.anylike, b: @temporary.b, c: @temporary.c, d: @temporary.d, dontlike: @temporary.dontlike, e: @temporary.e } }
    assert_redirected_to temporary_url(@temporary)
  end

  test "should destroy temporary" do
    assert_difference("Temporary.count", -1) do
      delete temporary_url(@temporary)
    end

    assert_redirected_to temporaries_url
  end
end
