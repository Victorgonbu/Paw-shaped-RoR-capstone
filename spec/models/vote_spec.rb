require 'rails_helper'

RSpec.describe Vote do
  describe 'Associations' do
    it 'belongs to user' do
      vote = Vote.reflect_on_association(:user)
      expect(vote.macro).to eq(:belongs_to)
    end
    it 'belongs to post' do
      vote = Vote.reflect_on_association(:post)
      expect(vote.macro).to eq(:belongs_to)
    end
  end

end
