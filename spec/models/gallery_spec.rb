require 'rails_helper'

RSpec.describe Gallery, type: :model do

	before do
		User.create!(email: "joe@gmail.com", password: "bloggsbloggs")
		@gallery = Gallery.create!(name: "My first gallery", user_id: 1)
		Image.create!(gallery_id: 1)
		Image.create!(gallery_id: 1)
	end
	
	describe "create" do
		it "should create a gallery object" do
			expect(User.all.count).to eq(1)
		end
	end

	describe "relations" do
		it "a gallery has many images" do
			expect(@gallery.images.count).to eq(2)
		end
	end

	describe "validations" do
		it "should not let a gallery be created that does not belong to a user" do
			expect(Gallery.create(name: "My second gallery")).to_not be_valid
		end

		it "should not let a gallery be created without a name" do
			@gallery.name = nil
			expect(@gallery).to_not be_valid
		end
	end
end