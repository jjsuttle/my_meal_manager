class RecipeStep < ApplicationRecord
  # Direct associations

  belongs_to :recipe

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    recipe.to_s
  end
end
