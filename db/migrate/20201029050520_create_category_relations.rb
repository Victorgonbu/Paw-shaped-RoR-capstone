class CreateCategoryRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :category_relations do |t|
      t.integer :priority
      t.references :category, null: false, foreign_key: true, index: true
      t.references :post, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
