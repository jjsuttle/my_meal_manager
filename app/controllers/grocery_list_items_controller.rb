class GroceryListItemsController < ApplicationController
  before_action :set_grocery_list_item, only: %i[show edit update destroy]

  def index
    @q = GroceryListItem.ransack(params[:q])
    @grocery_list_items = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show; end

  def new
    @grocery_list_item = GroceryListItem.new
  end

  def edit; end

  def create
    @grocery_list_item = GroceryListItem.new(grocery_list_item_params)

    if @grocery_list_item.save
      redirect_to @grocery_list_item,
                  notice: "Grocery list item was successfully created."
    else
      render :new
    end
  end

  def update
    if @grocery_list_item.update(grocery_list_item_params)
      redirect_to @grocery_list_item,
                  notice: "Grocery list item was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @grocery_list_item.destroy
    redirect_to grocery_list_items_url,
                notice: "Grocery list item was successfully destroyed."
  end

  private

  def set_grocery_list_item
    @grocery_list_item = GroceryListItem.find(params[:id])
  end

  def grocery_list_item_params
    params.require(:grocery_list_item).permit(:food_id, :purchased_status,
                                              :food_item, :note)
  end
end
