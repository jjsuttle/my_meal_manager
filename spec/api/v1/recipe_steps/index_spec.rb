require 'rails_helper'

RSpec.describe "recipe_steps#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/recipe_steps", params: params
  end

  describe 'basic fetch' do
    let!(:recipe_step1) { create(:recipe_step) }
    let!(:recipe_step2) { create(:recipe_step) }

    it 'works' do
      expect(RecipeStepResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['recipe_steps'])
      expect(d.map(&:id)).to match_array([recipe_step1.id, recipe_step2.id])
    end
  end
end
