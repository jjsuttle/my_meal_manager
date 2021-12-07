class RecipeStepResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :recipe_id, :integer
  attribute :step_instruction, :string
  attribute :step_duration_minutes, :integer

  # Direct associations

  # Indirect associations

end
