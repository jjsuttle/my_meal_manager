class CreateRecipeSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_steps do |t|
      t.integer :recipe_id
      t.text :step_instruction
      t.integer :step_duration_minutes

      t.timestamps
    end
  end
end
