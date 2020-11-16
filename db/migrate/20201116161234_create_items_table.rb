class CreateItemsTable < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.string :item_url
      t.integer :list_id
    end
  end
end
