require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:recipe_comments) }

    it { should have_many(:inventory_of_food_items) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
