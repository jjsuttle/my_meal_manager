require 'rails_helper'

RSpec.describe RecipeStepResource, type: :resource do
  describe 'serialization' do
    let!(:recipe_step) { create(:recipe_step) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(recipe_step.id)
      expect(data.jsonapi_type).to eq('recipe_steps')
    end
  end

  describe 'filtering' do
    let!(:recipe_step1) { create(:recipe_step) }
    let!(:recipe_step2) { create(:recipe_step) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: recipe_step2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([recipe_step2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:recipe_step1) { create(:recipe_step) }
      let!(:recipe_step2) { create(:recipe_step) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            recipe_step1.id,
            recipe_step2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            recipe_step2.id,
            recipe_step1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
