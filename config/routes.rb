Rails.application.routes.draw do
  resources :recips, path: "recipes" do
   resources :recipe_foods
  end
  resources :foods, only: [ :index, :new, :create, :destroy ]
  get '/public_recipes', to: 'recips#public_recipe'
  get '/shopping_list', to: 'recips#generate_shopping_list'
  devise_for :users
  root "home#index"
end
