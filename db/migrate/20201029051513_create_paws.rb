class CreatePaws < ActiveRecord::Migration[6.0]
  def change
    create_table :paws do |t|
      t.integer :value
      t.references :user, null: false, foreign_key: true, index: true
      t.references :post, null: true, foreign_key: true, index: true

      t.timestamps
    end
  end
end
