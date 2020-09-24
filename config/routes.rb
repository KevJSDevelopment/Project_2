Rails.application.routes.draw do
  # resources :order_items, only: []
  resources :items, only: [:index, :show]
  resources :orders, only: [:index, :show, :create]
  resources :users, only: [:new, :create, :destroy, :edit, :update, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
