class RecipeStepsController < ApplicationController
  before_action :set_recipe_step, only: [:show, :edit, :update, :destroy]

  # GET /recipe_steps
  def index
    @recipe_steps = RecipeStep.all
  end

  # GET /recipe_steps/1
  def show
  end

  # GET /recipe_steps/new
  def new
    @recipe_step = RecipeStep.new
  end

  # GET /recipe_steps/1/edit
  def edit
  end

  # POST /recipe_steps
  def create
    @recipe_step = RecipeStep.new(recipe_step_params)

    if @recipe_step.save
      redirect_to @recipe_step, notice: 'Recipe step was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /recipe_steps/1
  def update
    if @recipe_step.update(recipe_step_params)
      redirect_to @recipe_step, notice: 'Recipe step was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /recipe_steps/1
  def destroy
    @recipe_step.destroy
    message = "RecipeStep was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to recipe_steps_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_step
      @recipe_step = RecipeStep.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_step_params
      params.require(:recipe_step).permit(:recipe_id, :step_instruction, :step_duration_minutes)
    end
end
