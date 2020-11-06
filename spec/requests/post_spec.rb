require 'rails_helper'

RSpec.describe 'Post requests' do
let(:sign_up_params) do
  sign_up_params = {
    user: {
      name: 'victor',
      email: 'victor@victor.com'
    }
  }
end

let(:post_params) do
  file = fixture_file_upload(Rails.root.join('public', 'download.png'), 'image/png')
  post_params =  {
    post: {
      title: 'post title',
      description: 'post  description',
      goal: 2,
      image: file,
      user_id: User.first.id,
      category_id: Category.first.id

    }
  }
end
  describe 'GET /new' do
    it 'display new post form' do

      post '/users', params: sign_up_params
      get '/posts/new'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    it 'creates a new post' do
      Category.create(name: 'Help them out', priority: 1)
      post '/users', params: sign_up_params
      post '/posts', params: post_params
      expect(response).to have_http_status(302)
    end
  end
end
