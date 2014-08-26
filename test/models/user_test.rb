require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


	test "a user should enter a first name" do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

	test "a user should enter a last name" do
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

	test "a user should enter a profile name" do
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a unique profile name" do
		user = User.new
		user.profile_name= user(:Chris).profile_name
		
		assert !user.save
		assert !user.errors[:profile_name].empty?

	end

	test "a user should have a profile name without spaces" do
		user = User.new (first_name: "Chris", last_name "Salvi", email: "csalvi42@gmail.com")
		user.password = user.password_confirmation = '123456'

		user.profile_name = "my Profile with Spaces"

		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].includes?("Must be formatted correctly.")
	end
	
	test "a user can have a correctly formatted profile name" do
		user = User.new (first_name: "Chris", last_name "Salvi", email: "csalvi42@gmail.com")
		user.password = user.password_confirmation = '123456'

		user.profile_name = 'donsalvadori_1'
		assert user.valid?
	end


end
