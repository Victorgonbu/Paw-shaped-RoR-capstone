require 'rails_helper'

RSpec.describe 'Vote features' do
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

  let(:create_vote) do
    sign_up
    create_post
    visit("categories/#{Category.first.id}")
    click_on(class: 'vote-link')
  end

  describe 'Create' do
    it 'creates a vote for a post' do
      create_vote
      expect(page).to have_content('You voted a post')
    end
  end

  describe 'destroy' do
    it 'Destroy a vote in a voted post' do
      create_vote
      click_on(class: 'vote-link')
      expect(page).to have_content('Post unvoted')
    end
  end
end
