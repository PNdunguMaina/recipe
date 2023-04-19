Rails.application.routes.draw do
  resources :recips, path: "recipes" do
   resources :recipe_foods
  end
  resources :foods, only: [ :index, :new, :create, :destroy ]
  get '/public_recipes', to: 'recips#public_recipe'
  devise_for :users
  root "home#index"
end
