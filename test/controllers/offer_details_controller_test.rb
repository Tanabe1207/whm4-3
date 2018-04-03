require 'test_helper'

class OfferDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get offer_details_index_url
    assert_response :success
  end

end
