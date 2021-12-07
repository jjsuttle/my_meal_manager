class Api::V1::GroceryListItemsController < Api::V1::GraphitiController
  def index
    grocery_list_items = GroceryListItemResource.all(params)
    respond_with(grocery_list_items)
  end

  def show
    grocery_list_item = GroceryListItemResource.find(params)
    respond_with(grocery_list_item)
  end

  def create
    grocery_list_item = GroceryListItemResource.build(params)

    if grocery_list_item.save
      render jsonapi: grocery_list_item, status: :created
    else
      render jsonapi_errors: grocery_list_item
    end
  end

  def update
    grocery_list_item = GroceryListItemResource.find(params)

    if grocery_list_item.update_attributes
      render jsonapi: grocery_list_item
    else
      render jsonapi_errors: grocery_list_item
    end
  end

  def destroy
    grocery_list_item = GroceryListItemResource.find(params)

    if grocery_list_item.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: grocery_list_item
    end
  end
end
