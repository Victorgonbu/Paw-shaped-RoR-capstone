require 'rails_helper'


RSpec.describe 'User features' do
  let(:sign_up) do
    visit('/')
    click_link('Register')
    fill_in('Name', with: 'victor')
    fill_in('Email', with: 'victor@victor.com')
    click_button('Sign up')
  end
  describe 'Create new user' do
    it 'Create new user and redirect root_path being logged in' do
      sign_up
      expect(page).to have_content('Signed up')
    end
  end
end
