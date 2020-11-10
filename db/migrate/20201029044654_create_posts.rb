class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :goal
      t.references :user, null: false, foreign_key: true, index: true
      t.bigint :category_id, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
