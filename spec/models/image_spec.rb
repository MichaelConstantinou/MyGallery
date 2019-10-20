# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Image, type: :model do
  before do
    User.delete_all
    Image.delete_all
    @user = User.create!(email: 'joe@gmail.com', password: 'bloggsbloggs')
    @gallery = Gallery.create!(name: 'My first gallery', user_id: @user.id)
    Image.create!(url: 'url', gallery_id: @gallery.id)
  end

  describe 'create' do
    it 'should create an image object' do
      expect(Image.all.count).to eq(1)
    end
  end

  describe 'validations' do
    it 'should not let an image be created that does not belong to a gallery' do
      expect(Image.create(url: 'url')).to_not be_valid
    end
  end
end
