require "test_helper"

class ReferrersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @referrer = referrers(:one)
  end

  test "should get index" do
    get referrers_url
    assert_response :success
  end

  test "should get new" do
    get new_referrer_url
    assert_response :success
  end

  test "should create referrer" do
    assert_difference("Referrer.count") do
      post referrers_url, params: { referrer: { address: @referrer.address, email: @referrer.email, lab_branch_id: @referrer.lab_branch_id, name: @referrer.name, phone: @referrer.phone, share_code: @referrer.share_code } }
    end

    assert_redirected_to referrer_url(Referrer.last)
  end

  test "should show referrer" do
    get referrer_url(@referrer)
    assert_response :success
  end

  test "should get edit" do
    get edit_referrer_url(@referrer)
    assert_response :success
  end

  test "should update referrer" do
    patch referrer_url(@referrer), params: { referrer: { address: @referrer.address, email: @referrer.email, lab_branch_id: @referrer.lab_branch_id, name: @referrer.name, phone: @referrer.phone, share_code: @referrer.share_code } }
    assert_redirected_to referrer_url(@referrer)
  end

  test "should destroy referrer" do
    assert_difference("Referrer.count", -1) do
      delete referrer_url(@referrer)
    end

    assert_redirected_to referrers_url
  end
end
