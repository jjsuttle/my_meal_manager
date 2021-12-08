class RecipeIngredient < ApplicationRecord
  enum quantity_units: { "units" => 0, "tbs" => 1, "tsp" => 2, "cups" => 3, "oz" => 4,
                         "pounds" => 5, "fl_oz" => 6, "quart" => 7, "pint" => 8, "gallon" => 9, "mg" => 10, "g" => 11, "ml" => 12, "l" => 13 }

  # Direct associations

  belongs_to :recipe

  belongs_to :food,
             optional: true,
             class_name: "InventoryOfFoodItem"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    ingredient_name
  end
end
