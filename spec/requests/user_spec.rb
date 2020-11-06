require 'rails_helper'

RSpec.describe 'User requests' do
  describe 'GET /new' do
    it 'Sign up form success status' do
      get '/users/new'
      expect(response).to have_http_status(200)
    end
  end
  describe 'POST /create' do
    it 'creates a post' do
      user_params = {
        user: {
          name: 'victor',
          email: 'victor@victor.com'
        }
      }
      post '/users', params: user_params
      expect(response).to have_http_status(302)
    end
  end
end
