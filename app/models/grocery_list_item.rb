class GroceryListItem < ApplicationRecord
  enum purchased_status: { "need_to_purchase" => 0, "purchased" => 1 }

  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    food_id
  end
end
