class AddStoreNameToEntries < ActiveRecord::Migration[8.1]
  def change
    add_column :entries, :store_name, :string
  end
end
