class RecipeReview < ApplicationRecord
  # Direct associations

  belongs_to :recipe

  belongs_to :commentor,
             :class_name => "User",
             :foreign_key => "reviewer_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    commentor.to_s
  end

end
