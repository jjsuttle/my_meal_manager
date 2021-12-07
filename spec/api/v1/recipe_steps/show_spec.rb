require 'rails_helper'

RSpec.describe "recipe_steps#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/recipe_steps/#{recipe_step.id}", params: params
  end

  describe 'basic fetch' do
    let!(:recipe_step) { create(:recipe_step) }

    it 'works' do
      expect(RecipeStepResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('recipe_steps')
      expect(d.id).to eq(recipe_step.id)
    end
  end
end
