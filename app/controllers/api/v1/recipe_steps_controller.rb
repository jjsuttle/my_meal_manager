class Api::V1::RecipeStepsController < Api::V1::GraphitiController
  def index
    recipe_steps = RecipeStepResource.all(params)
    respond_with(recipe_steps)
  end

  def show
    recipe_step = RecipeStepResource.find(params)
    respond_with(recipe_step)
  end

  def create
    recipe_step = RecipeStepResource.build(params)

    if recipe_step.save
      render jsonapi: recipe_step, status: 201
    else
      render jsonapi_errors: recipe_step
    end
  end

  def update
    recipe_step = RecipeStepResource.find(params)

    if recipe_step.update_attributes
      render jsonapi: recipe_step
    else
      render jsonapi_errors: recipe_step
    end
  end

  def destroy
    recipe_step = RecipeStepResource.find(params)

    if recipe_step.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: recipe_step
    end
  end
end
