require 'rails_helper'

RSpec.describe Image, type: :model do

	before do
		User.create!(email: "joe@gmail.com", password: "bloggsbloggs")
    Gallery.create!(name: "My first gallery", user_id: 1)
		Image.create!(url: "url", gallery_id: 1)
	end
	
	describe "create" do
		it "should create an image object" do
			expect(Image.all.count).to eq(1)
		end
	end

	describe "validations" do
		it "should not let an image be created that does not belong to a gallery" do
			expect(Image.create(url: "url")).to_not be_valid
		end
	end
end