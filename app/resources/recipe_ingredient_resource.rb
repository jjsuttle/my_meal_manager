class RecipeIngredientResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :recipe_id, :integer
  attribute :food_id, :integer
  attribute :food_item, :string
  attribute :quantity, :integer
  attribute :quantity_units, :string

  # Direct associations

  belongs_to :food,
             resource: InventoryOfFoodItemResource

  # Indirect associations

end
