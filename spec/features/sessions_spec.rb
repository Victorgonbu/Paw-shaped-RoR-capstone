require 'rails_helper'

RSpec.describe 'Sessions features' do
  let(:user) do
    User.create(name: 'victor', email: 'victor@victor.com')
  end
  let(:log_in) do
    visit('/')
    click_link('Login')
    fill_in('Name', with: 'victor')
    click_button('Log in')
  end

  describe 'create' do
    it 'Creates new session' do
      user
      log_in
      expect(page).to have_content('logged in')

    end
  end

  describe 'destroy' do
    it 'Destroys user session' do
      user
      log_in
      click_link('Sign out')
      expect(page).to have_content('Logged out')
    end
  end
end
