class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.integer :servings
      t.integer :cooking_time
      t.text :instructions

      t.timestamps
    end
  end
end
