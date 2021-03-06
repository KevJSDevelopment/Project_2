Rails.application.routes.draw do
  resources :wishlists, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # resources :order_items, only: []
  resources :items, only: [:index, :show]
  resources :orders, only: [:index, :show, :destroy]
  resources :users, only: [:new, :create, :destroy, :edit, :update, :show]

  post "/add_order/:id", to: "order_items#add_or_create", as: "add_order"
  post "/add_wishlist/:id", to: "wishlist_items#add_to_wishlist", as: "add_wishlist"
  get "/", to: "static#greetings", as: "greetings"
  get "/goodbye", to: "static#goodbye", as: "bye"
  get "/about", to: "static#about"
  get "/contact", to: "static#contact"

  post "/purchase", to: "orders#purchase", as: "purchase"

  delete "/remove_item/:id", to: "order_items#remove_item", as: "remove_item"
  delete "/remove_item_wishlist/:id", to: "wishlist_items#remove_item", as: "remove_item_from_wishlist"
  
  get "/login", to: "users#login", as: "login"
  post "/login", to: "users#process_login"
  get "/logout", to: "users#logout", as: "logout"
  get "/user_deleted", to: "users#user_deleted", as: "user_deleted"
  
end
