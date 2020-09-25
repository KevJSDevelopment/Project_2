Rails.application.routes.draw do
  # resources :order_items, only: []
  resources :items, only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users, only: [:new, :create, :destroy, :edit, :update, :show]

  post "/order", to: "order#create", as: "add_order"
  get "/greetings", to: "static#greetings"
  get "/goodbye", to: "static#goodbye", as: "bye"
  get "/about", to: "static#about"
  get "/contact", to: "static#contact"

end
