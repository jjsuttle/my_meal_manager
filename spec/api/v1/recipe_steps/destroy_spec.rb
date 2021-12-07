require 'rails_helper'

RSpec.describe "recipe_steps#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/recipe_steps/#{recipe_step.id}"
  end

  describe 'basic destroy' do
    let!(:recipe_step) { create(:recipe_step) }

    it 'updates the resource' do
      expect(RecipeStepResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { RecipeStep.count }.by(-1)
      expect { recipe_step.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
