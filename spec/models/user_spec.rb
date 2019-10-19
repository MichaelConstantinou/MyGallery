require 'rails_helper'

RSpec.describe User, type: :model do

	before do
		@user = User.create!(email: "joe@gmail.com", password: "bloggsbloggs")
		Gallery.create(name: "My first gallery", user_id: 1)
		Gallery.create(name: "My second gallery", user_id: 1)
	end
	
	describe "create" do
		it "should create a user object when ran" do
			expect(User.all.count).to eq(1)
		end
	end

	describe "relations" do
		it "a user has many galleries" do
			expect(@user.galleries.count).to eq(2)
		end
	end

	describe "validations" do
		it "should not let a user be created without an email" do
			@user.email = nil
			expect(@user).to_not be_valid
		end

		it "should not let a user be created without a password" do
			@user.password = nil
			expect(@user).to_not be_valid
		end
	end
end