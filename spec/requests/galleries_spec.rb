require 'rails_helper'

RSpec.describe GalleriesController, type: :request do
	include_context 'a logged in user'

	describe 'GET /galleries' do
		before do
			Gallery.create!(name: 'My first gallery', user_id: User.last.id)
			get '/galleries'
		end

		it 'returns HTTP status 200' do
			expect(response.status).to eq(200)
		end
	end

	describe 'POST /galleries' do
		before do
			post '/galleries', params: { name: 'My first gallery'}
		end

		it 'returns HTTP status 302' do
			expect(response.status).to eq(302)
		end

		it 'creates a gallery with the given name' do
			expect(User.last.galleries.last.name).to eq('My first gallery')
		end

		it 'redirects to show on creation' do
			expect(response).to redirect_to "/galleries/#{Gallery.last.id}"
		end
	end

	describe 'PUT /gallery' do
		before do
			Gallery.create!(name: 'My first gallery', user_id: User.last.id)
			put "/galleries/#{Gallery.last.id}", params: { name: 'My second gallery'}
		end

		it 'returns HTTP status 302' do
			expect(response.status).to eq(302)
		end

		it 'updates the gallery with the given name' do
			expect(User.last.galleries.count).to eq(1)
			expect(User.last.galleries.last.name).to eq('My second gallery')
		end

		it 'redirects to show on update' do
			expect(response).to redirect_to "/galleries/#{Gallery.last.id}"
		end
	end

	describe 'GET /gallery/:id' do
		before do
			Gallery.create!(name: 'My first gallery', user_id: User.last.id)
			get "/galleries/#{Gallery.last.id}"
		end

		it 'returns HTTP status 200' do
			expect(response.status).to eq(200)
		end
	end

	describe 'DELETE /gallery' do
		before do
			Gallery.create!(name: 'My first gallery', user_id: User.last.id)
			delete "/galleries/#{Gallery.last.id}"
		end

		it 'returns HTTP status 302' do
			expect(response.status).to eq(302)
		end

		it 'deletes the gallery' do
			expect(User.last.galleries.count).to eq(0)
		end

		it 'redirects to index on update' do
			expect(response).to redirect_to "/galleries"
		end
	end
end