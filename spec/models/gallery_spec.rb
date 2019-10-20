# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Gallery, type: :model do
  before do
    User.delete_all
    @user = User.create!(email: 'joe@gmail.com', password: 'bloggsbloggs')
    @gallery = Gallery.create!(name: 'My first gallery', user_id: @user.id)
    Image.create!(gallery_id: @gallery.id)
    Image.create!(gallery_id: @gallery.id)
  end

  describe 'create' do
    it 'should create a gallery object' do
      expect(User.all.count).to eq(1)
    end
  end

  describe 'relations' do
    it 'a gallery has many images' do
      expect(@gallery.images.count).to eq(2)
    end
  end

  describe 'validations' do
    it 'should not let a gallery be created that does not belong to a user' do
      expect(Gallery.create(name: 'My second gallery')).to_not be_valid
    end

    it 'should not let a gallery be created without a name' do
      @gallery.name = nil
      expect(@gallery).to_not be_valid
    end
  end
end
