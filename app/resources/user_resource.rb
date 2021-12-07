class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :first_name, :string
  attribute :last_name, :string

  # Direct associations

  has_many   :recipe_comments,
             resource: RecipeReviewResource,
             foreign_key: :reviewer_id

  has_many   :inventory_of_food_items

  # Indirect associations

end
