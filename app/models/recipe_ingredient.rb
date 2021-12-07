class RecipeIngredient < ApplicationRecord
  # Direct associations

  belongs_to :recipe

  belongs_to :food,
             optional: true,
             class_name: "InventoryOfFoodItem"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    recipe.to_s
  end
end
