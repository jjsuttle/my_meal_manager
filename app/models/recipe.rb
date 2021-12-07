class Recipe < ApplicationRecord
  # Direct associations

  has_many   :recipe_steps,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    recipe_name
  end

end
