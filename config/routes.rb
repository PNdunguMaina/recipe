Rails.application.routes.draw do
  resources :recips, path: "recipes" do
   resources :recipe_foods
  end
  resources :foods, only: [ :index, :new, :create, :destroy ]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "home#index"
end
