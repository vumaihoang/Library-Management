Rails.application.routes.draw do
  devise_for :users

  root "static_pages#home"
  get "static_pages/help"
  get "orders_active", to: "orders#active"

  resources :books
  resources :publishers
  resources :authors
  resources :carts
  resources :orders
  resources :line_items
  resources :users
  
  delete 'admin/users/:id' => 'admin/users#destroy', :via => :delete, :as => :admin_destroy_user
  delete 'admin/authors/:id' => 'admin/authors#destroy', :via => :delete, :as => :admin_destroy_author
  delete 'admin/publishers/:id' => 'admin/publishers#destroy', :via => :delete, :as => :admin_destroy_publisher
  delete 'admin/books/:id' => 'admin/books#destroy', :via => :delete, :as => :admin_destroy_book

  namespace :admin do
    resources :books
    resources :authors
    resources :publishers
    resources :users
  end
end
