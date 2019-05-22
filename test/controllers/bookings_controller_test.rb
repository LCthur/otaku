require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get loans" do
    get bookings_loans_url
    assert_response :success
  end

  test "should get lendings" do
    get bookings_lendings_url
    assert_response :success
  end

end
