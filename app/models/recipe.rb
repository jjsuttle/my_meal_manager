class Recipe < ApplicationRecord
  # Direct associations

  has_many   :recipe_comments,
             class_name: "RecipeReview",
             dependent: :destroy

  has_many   :recipe_ingredients,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    recipe_name
  end
end
