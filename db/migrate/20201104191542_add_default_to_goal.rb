class AddDefaultToGoal < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :goal, :integer, :default => 0
  end
end
