class RecipeReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :reviewer_id, :integer
  attribute :recipe_id, :integer
  attribute :rating, :float
  attribute :review, :string

  # Direct associations

  belongs_to :recipe

  belongs_to :commentor,
             resource: UserResource,
             foreign_key: :reviewer_id

  # Indirect associations

end
