json.extract! grocery_list_item, :id, :food_id, :purchased_status, :food_item,
              :note, :created_at, :updated_at
json.url grocery_list_item_url(grocery_list_item, format: :json)
