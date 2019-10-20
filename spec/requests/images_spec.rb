# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImagesController, type: :request do
  include_context 'a logged in user'

  describe 'POST /images' do
    before do
      @user_gallery = Gallery.create!(name: 'My first gallery', user_id: User.last.id)
      post '/images', params: { url: 'image', gallery_id: @user_gallery.id }
    end

    it 'returns HTTP status 302' do
      expect(response.status).to eq(302)
    end

    it 'uploads an image' do
      expect(@user_gallery.images.count).to eq(1)
    end

    it 'redirects to parent gallery on creation' do
      expect(response).to redirect_to "/galleries/#{@user_gallery.id}"
    end
  end

  describe 'PUT /images' do
    before do
      @user_gallery = Gallery.create!(name: 'My first gallery', user_id: User.last.id)
      Image.create!(url: 'image', gallery_id: @user_gallery.id)
      put "/images/#{Image.last.id}", params: { image: { url: 'new_image', gallery_id: @user_gallery.id } }
    end

    it 'returns HTTP status 302' do
      expect(response.status).to eq(302)
    end

    it 'replaces the existing image with the new uploaded image' do
      expect(@user_gallery.images.count).to eq(1)
    end

    it 'redirects to show on update' do
      expect(response).to redirect_to "/images/#{Image.last.id}"
    end
  end

  describe 'DELETE /images' do
    before do
      @user_gallery = Gallery.create!(name: 'My first gallery', user_id: User.last.id)
      Image.create!(url: 'image', gallery_id: @user_gallery.id)
      delete "/images/#{Image.last.id}"
    end

    it 'returns HTTP status 302' do
      expect(response.status).to eq(302)
    end

    it 'deletes the image' do
      expect(@user_gallery.images.count).to eq(0)
    end

    it 'redirects to gallery index on update' do
      expect(response).to redirect_to "/galleries/#{@user_gallery.id}"
    end
  end
end
