class RecipeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :recipe_name, :string
  attribute :servings, :integer
  attribute :cooking_time, :integer

  # Direct associations

  has_many   :recipe_steps

  # Indirect associations

end
