class DropJoinTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :categories_posts
    add_column :posts, :category_id, :bigint, index: true, foreign_key: true 
  end
end
