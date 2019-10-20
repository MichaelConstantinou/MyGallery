# frozen_string_literal: true

RSpec.shared_context 'a logged in user' do
  User.create(email: 'user@gmail.com', password: 'top secret')
  before do
    post user_session_path, params: { user: { email: 'user@gmail.com', password: 'top secret' } }
  end

  after do
    # I would normally run DatabaseCleaner instead as best practice but had issues configuring it
    Gallery.delete_all
  end
end
