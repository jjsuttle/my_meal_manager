require "rails_helper"

RSpec.describe "recipe_steps#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/recipe_steps/#{recipe_step.id}", payload
  end

  describe "basic update" do
    let!(:recipe_step) { create(:recipe_step) }

    let(:payload) do
      {
        data: {
          id: recipe_step.id.to_s,
          type: "recipe_steps",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(RecipeStepResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { recipe_step.reload.attributes }
    end
  end
end
