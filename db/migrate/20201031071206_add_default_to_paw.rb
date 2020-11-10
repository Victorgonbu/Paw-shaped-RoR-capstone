class AddDefaultToPaw < ActiveRecord::Migration[6.0]
  def change
    change_column :paws, :value, :integer, :default => 10
  end
end
