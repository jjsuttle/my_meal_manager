class GroceryListItemsController < ApplicationController
  before_action :set_grocery_list_item, only: [:show, :edit, :update, :destroy]

  # GET /grocery_list_items
  def index
    @grocery_list_items = GroceryListItem.page(params[:page]).per(10)
  end

  # GET /grocery_list_items/1
  def show
  end

  # GET /grocery_list_items/new
  def new
    @grocery_list_item = GroceryListItem.new
  end

  # GET /grocery_list_items/1/edit
  def edit
  end

  # POST /grocery_list_items
  def create
    @grocery_list_item = GroceryListItem.new(grocery_list_item_params)

    if @grocery_list_item.save
      redirect_to @grocery_list_item, notice: 'Grocery list item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /grocery_list_items/1
  def update
    if @grocery_list_item.update(grocery_list_item_params)
      redirect_to @grocery_list_item, notice: 'Grocery list item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /grocery_list_items/1
  def destroy
    @grocery_list_item.destroy
    redirect_to grocery_list_items_url, notice: 'Grocery list item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grocery_list_item
      @grocery_list_item = GroceryListItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def grocery_list_item_params
      params.require(:grocery_list_item).permit(:food_id, :purchased_status, :food_item, :note)
    end
end
