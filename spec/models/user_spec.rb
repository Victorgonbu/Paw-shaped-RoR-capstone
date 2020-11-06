require 'rails_helper'

RSpec.describe User do
  let(:user) do
    User.create(name: 'victor', email: 'victor@victor.com')
  end

  describe 'Associations' do
    it 'has many paws' do
      user = User.reflect_on_association(:paws)
      expect(user.macro).to eq(:has_many)
    end
    it 'has many votes' do
      user = User.reflect_on_association(:votes)
      expect(user.macro).to eq(:has_many)
    end
    it 'has many posts' do
      user = User.reflect_on_association(:posts)
      expect(user.macro).to eq(:has_many)
    end
  end

  describe 'Validations' do
    describe 'name' do
      it 'must be unique' do
        user
        expect(User.create(name: 'victor', email: 'victor@victormanuel.com')).to_not be_valid
      end
    end

    describe 'email' do
      it 'must be valid' do
        user.email = 'vic'
        expect(user).to_not be_valid
      end

      it 'must be unique' do
        user
        expect(User.create(name: 'manuel', email: 'victor@victor.com')).to_not be_valid
      end

      it 'is valid' do
        expect(user).to be_valid
      end

    end
  end
end
