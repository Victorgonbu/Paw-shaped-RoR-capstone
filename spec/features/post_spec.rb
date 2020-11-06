require 'rails_helper'

RSpec.describe 'Post features' do
  let(:sign_up) do
    visit('/')
    click_link('Register')
    fill_in('Name', with: 'victor')
    fill_in('Email', with: 'victor@victor.com')
    click_button('Sign up')
  end

  let(:create_post) do
    Category.create(name: 'Help them out', priority: 1)
    file = fixture_file_upload(Rails.root.join('public', 'download.png'), 'image/png')
    Post.create(title: 'post title', description: 'post description', goal: 2, image: file, category_id: Category.first.id, user_id: User.first.id)
  end

  describe 'New' do
    it 'Creates a new post' do
      sign_up
      visit('posts/new')
      expect(page).to have_content('Create a new post')
    end
  end

  describe 'Show' do
    it 'Show post page' do
      sign_up
      create_post
      visit('/')
      click_link('Help them out')
      click_link('post title')
      expect(page).to have_content('post title')
      expect(page).to have_content('post description')
    end
  end
end
