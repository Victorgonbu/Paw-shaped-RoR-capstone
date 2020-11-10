require 'rails_helper'

RSpec.describe Paw do
  describe 'Associations' do
    it 'belongs to user' do
      paw = Paw.reflect_on_association(:user)
      expect(paw.macro).to eq(:belongs_to)
    end
    it 'belongs to post' do
      paw = Paw.reflect_on_association(:post)
      expect(paw.macro).to eq(:belongs_to)
    end
  end
end
