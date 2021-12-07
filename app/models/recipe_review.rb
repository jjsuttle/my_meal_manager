class RecipeReview < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    commentor.to_s
  end

end
