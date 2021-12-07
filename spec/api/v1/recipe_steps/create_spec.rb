require 'rails_helper'

RSpec.describe "recipe_steps#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/recipe_steps", payload
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
          type: 'recipe_steps',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(RecipeStepResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { RecipeStep.count }.by(1)
    end
  end
end
