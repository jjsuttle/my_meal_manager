json.extract! inventory_of_food_item, :id, :user_id, :date_purchased,
              :expiration_date, :days_until_expiration, :purchased_status, :food_name, :note, :created_at, :updated_at
json.url inventory_of_food_item_url(inventory_of_food_item, format: :json)
