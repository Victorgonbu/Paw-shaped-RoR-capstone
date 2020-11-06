require 'rails_helper'

RSpec.describe Category do
  describe 'Associations' do
    it 'has many posts' do
      category = Category.reflect_on_association(:posts)
      expect(category.macro).to eq(:has_many)
    end
    it 'has many votes' do
      category = Category.reflect_on_association(:votes)
      expect(category.macro).to eq(:has_many)
    end
  end

  describe '.ordered' do
    it 'order by priority' do
      expect(Category.ordered.to_sql).to eq(Category.includes([:posts, :votes]).order(priority: :asc).to_sql)
    end
  end
end
