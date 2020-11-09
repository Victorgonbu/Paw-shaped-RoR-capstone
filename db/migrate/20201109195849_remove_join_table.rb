class RemoveJoinTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :categories_posts
  end
end
