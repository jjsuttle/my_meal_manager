require "rails_helper"

RSpec.describe Recipe, type: :model do
  describe "Direct Associations" do
    it { should have_many(:recipe_comments) }

    it { should have_many(:recipe_ingredients) }

    it { should have_many(:recipe_steps) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
