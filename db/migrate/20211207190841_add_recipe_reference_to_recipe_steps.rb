class AddRecipeReferenceToRecipeSteps < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :recipe_steps, :recipes
    add_index :recipe_steps, :recipe_id
    change_column_null :recipe_steps, :recipe_id, false
  end
end
