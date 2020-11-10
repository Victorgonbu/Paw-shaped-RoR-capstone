class RemovePriorityFromCategory < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :priority, :integer
  end
end
