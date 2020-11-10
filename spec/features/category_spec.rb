require 'rails_helper'

RSpec.describe 'Category features' do
  let(:categories) do
    Category.create(name: 'Adoptions', priority: 1)
    Category.create(name: 'Missing', priority: 2)
    Category.create(name: 'Found', priority: 3)
  end
  let(:user) do
    User.create(name: 'victor', email: 'victor@victor.com')
  end
  let(:log_in) do
    visit('/')
    click_link('Login')
    fill_in('Name', with: 'victor')
    click_button('Log in')
  end
  let(:post) do
    file = fixture_file_upload(Rails.root.join('public', 'download.png'), 'image/png')
    Post.create(title: 'post title', description: 'post description', goal: 2, image: file, category_id: Category.first.id, user_id: User.first.id)
  end

  describe 'Index' do
    it 'Display all categories grid' do
      categories
      user
      log_in

      visit('/')
      expect(page).to have_content('Missing')
      expect(page).to have_content('Adoptions')
      expect(page).to have_content('Found')
    end
  end

  describe 'Show' do
    it 'Display all post from specific category' do
      categories
      user
      log_in
      post
      visit('/')
      click_link('Adoptions')
      expect(page).to have_content(Post.first.title)
    end
  end
end
