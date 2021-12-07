require 'rails_helper'

RSpec.describe "recipe_ingredients#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/recipe_ingredients", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'recipe_ingredients',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(RecipeIngredientResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { RecipeIngredient.count }.by(1)
    end
  end
end
