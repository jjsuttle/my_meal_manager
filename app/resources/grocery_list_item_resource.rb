class GroceryListItemResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :food_id, :integer
  attribute :purchased_status, :string_enum, allow: GroceryListItem.purchased_statuses.keys
  attribute :food_item, :string
  attribute :note, :string

  # Direct associations

  # Indirect associations

end
