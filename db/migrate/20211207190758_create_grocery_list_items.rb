class CreateGroceryListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :grocery_list_items do |t|
      t.integer :food_id
      t.integer :purchased_status
      t.string :food_item
      t.string :note

      t.timestamps
    end
  end
end
