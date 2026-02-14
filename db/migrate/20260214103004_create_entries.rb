class CreateEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :entries do |t|
      t.string :category
      t.string :genre
      t.string :product_name
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
