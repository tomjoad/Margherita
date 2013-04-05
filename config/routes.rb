Margherita::Application.routes.draw do
  get "services/contact"
  get "services/contact_us"
  get "services/catering"
  get "services/reservations"

  match "/signup", to: "users#new"
  match "/signin", to: "sessions#new"
  match "/signout", to: "sessions#destroy", :via => :delete

  match "line_item/:id" => 'line_items#update'
  match "line_items/:id" => 'line_items#destroy'

  get "home/index"
  get "home/help"
  get "home/about"

  root :to => "home#index"

  resource :cart, only: [:new, :destroy]
  resources :line_items, only: [:index]
  resources :products
  resources :promos, only: [:index, :new, :show, :create, :destroy]

  resources :orders, only: [:index, :new, :create, :update] do
    collection do
      post 'checkout'
      get 'confirmation'
    end
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  resources :categories do
    resources :products
  end

  namespace :admin do
    resources :products
    resources :users
    resources :orders
    resources :categories
  end

end
