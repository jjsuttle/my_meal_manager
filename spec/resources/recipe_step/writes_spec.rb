require "rails_helper"

RSpec.describe RecipeStepResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "recipe_steps",
          attributes: {},
        },
      }
    end

    let(:instance) do
      RecipeStepResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { RecipeStep.count }.by(1)
    end
  end

  describe "updating" do
    let!(:recipe_step) { create(:recipe_step) }

    let(:payload) do
      {
        data: {
          id: recipe_step.id.to_s,
          type: "recipe_steps",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      RecipeStepResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { recipe_step.reload.updated_at }
      # .and change { recipe_step.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:recipe_step) { create(:recipe_step) }

    let(:instance) do
      RecipeStepResource.find(id: recipe_step.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { RecipeStep.count }.by(-1)
    end
  end
end
