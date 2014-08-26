require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  
  test "should get show" do
    get :show, id: user (:Chris).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profile not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "that variables are assigned on successful profile viewings" do
  	 get :show, id: user (:Chris).profile_name
  	 assert assigns(:user)
  	 assert_not_empty assigns(:statuses)
  	end

  	test "only shows the correct statuses for user"
	  	get :show, id: users(:Chris).profile_name
	  		assigns(:statuses).each do |status|
	  		assert_equal users(:Chris), status.user
  	end
end
