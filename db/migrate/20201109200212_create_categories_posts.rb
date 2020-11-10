class CreateCategoriesPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_posts do |t|
      t.references :category, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.timestamps
    end
  end
end
