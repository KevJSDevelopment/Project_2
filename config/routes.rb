Rails.application.routes.draw do
  resources :wishlists, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # resources :order_items, only: []
  resources :items, only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users, only: [:new, :create, :destroy, :edit, :update, :show]

  post "/add_order/:id", to: "order_items#add_or_create", as: "add_order"
  get "/", to: "static#greetings", as: "greetings"
  get "/goodbye", to: "static#goodbye", as: "bye"
  get "/about", to: "static#about"
  get "/contact", to: "static#contact"

  post "/purchase", to: "orders#purchase", as: "purchase"
  get "/login", to: "users#login", as: "login"
  post "/login", to: "users#process_login"
  get "/logout", to: "users#logout", as: "logout"
  get "/user_deleted", to: "users#user_deleted", as: "user_deleted"
  
end
