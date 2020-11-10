class RemoveCategoryidFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :category_id
  end
end
