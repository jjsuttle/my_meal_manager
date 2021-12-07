class RecipeStepsController < ApplicationController
  before_action :set_recipe_step, only: %i[show edit update destroy]

  def index
    @q = RecipeStep.ransack(params[:q])
    @recipe_steps = @q.result(distinct: true).includes(:recipe).page(params[:page]).per(10)
  end

  def show; end

  def new
    @recipe_step = RecipeStep.new
  end

  def edit; end

  def create
    @recipe_step = RecipeStep.new(recipe_step_params)

    if @recipe_step.save
      message = "RecipeStep was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @recipe_step, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @recipe_step.update(recipe_step_params)
      redirect_to @recipe_step, notice: "Recipe step was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @recipe_step.destroy
    message = "RecipeStep was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to recipe_steps_url, notice: message
    end
  end

  private

  def set_recipe_step
    @recipe_step = RecipeStep.find(params[:id])
  end

  def recipe_step_params
    params.require(:recipe_step).permit(:recipe_id, :step_instruction,
                                        :step_duration_minutes)
  end
end
