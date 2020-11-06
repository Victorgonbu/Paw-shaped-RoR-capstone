require 'rails_helper'

RSpec.describe 'Paw features' do
  let(:user) do
    User.create(name: 'victor', email: 'victor@victor.com')
  end
  let(:log_in) do
    visit('/')
    click_link('Login')
    fill_in('Name', with: 'victor')
    click_button('Log in')
  end
  let(:category) do
    Category.create(name: 'Help them out', priority: 1)
  end
  let(:post) do
     file = fixture_file_upload(Rails.root.join('public', 'download.png'), 'image/png')
    Post.create(title: 'post title', description: 'post description', goal: 2, image: file, category_id: Category.first.id, user_id: User.first.id)
  end
  let(:paws) do
    Paw.create(user_id: user.id)
  end

  describe 'Create' do
    it 'create a new paw when a user buy it' do
      user
      log_in
      click_link('Get Paws')
      click_link('Get 1 paws x $10 USD')
      expect(page).to have_content('1 paws purchased')
    end
  end

  describe 'Update' do
    it 'update paw post_id attribute when user gives a paw to a post' do
      user
      log_in
      paws
      category
      post
      visit("categories/#{Category.first.id}")
      click_on(class: 'paw-button')
      expect(page).to have_content('Paw gifted')
    end
    it 'does not update if user does not have enough paws to give' do
      user
      log_in
      category
      post
      visit("categories/#{Category.first.id}")
      click_on(class: 'paw-button')
      expect(page).to have_content('Not enough paws :c')
    end
  end
end
