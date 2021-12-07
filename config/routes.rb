Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "inventory_of_food_items#index"
  resources :recipe_reviews
  resources :grocery_list_items
  resources :recipe_steps
  resources :recipe_ingredients
  resources :recipes
  resources :inventory_of_food_items
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
