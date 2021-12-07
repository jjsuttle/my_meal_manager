class User < ApplicationRecord
  # Direct associations

  has_many   :recipe_comments,
             :class_name => "RecipeReview",
             :foreign_key => "reviewer_id",
             :dependent => :destroy

  has_many   :inventory_of_food_items,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
