require 'rails_helper'

RSpec.describe Post do
  let(:user_and_category) do
    Category.create(name: 'Adoptions', priority: 1)
    User.create(name: 'victor', email: 'victor@victor.com')
  end
  let(:post) do
     file = fixture_file_upload(Rails.root.join('public', 'download.png'), 'image/png')
    Post.create(title: 'post title', description: 'post description', goal: 2, image: file, category_id: Category.first.id, user_id: User.first.id)
  end
  describe 'Associations' do
    it 'belongs to user' do
      post = Post.reflect_on_association(:user)
      expect(post.macro).to eq(:belongs_to)
    end
    it 'belongs to category' do
      post = Post.reflect_on_association(:category)
      expect(post.macro).to eq(:belongs_to)
    end
    it 'has many paws' do
      post = Post.reflect_on_association(:paws)
      expect(post.macro).to eq(:has_many)
    end
    it 'has many votes' do
      post = Post.reflect_on_association(:votes)
      expect(post.macro).to eq(:has_many)
    end
  end

  describe 'Validations' do
    describe 'title' do
      it 'must be present' do
        user_and_category
        post.title = ''
        expect(post).to_not be_valid
        post.title = 'something'
        expect(post).to be_valid
      end
    end
    describe 'description' do
      it 'must be present' do
        user_and_category
        post.description = ''
        expect(post).to_not be_valid
        post.description = 'something'
        expect(post).to be_valid
      end
    end
    describe 'goal' do
      it 'must be integer' do
        user_and_category
        post.goal = 'hello'
        expect(post).to_not be_valid
        post.goal = 2
        expect(post).to be_valid
      end
    end
    describe 'image' do
      it 'must be present' do
        user_and_category
        post.image = nil
        expect(post).to_not be_valid
      end
    end

    describe 'category' do
      it 'must be present' do
        user_and_category
        post.category_id = nil
        expect(post).to_not be_valid
      end
    end
  end
end
