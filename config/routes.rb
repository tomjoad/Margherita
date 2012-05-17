Margherita::Application.routes.draw do
  root :to => "home#index"

  # should be resources, links and actions need to be rapaired

  resource :cart, only: [:new, :destroy]
  #   member do
  #     get "add_to"
  #   end
  # end

  resources :line_items, only: [:index]

  resources :products
  #    member do
  #     get "add_to_cart"
  #   end
  # end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  resources :categories do
    resources :products, :only => [:index, :show]
  end

  match "/signup", to: "users#new"
  match "/signin", to: "sessions#new"
  match "/signout", to: "sessions#destroy", via: :delete
  # match ":controller/:action/:id/:subtract"
  match "line_item/:id" => 'line_items#update'
  match "line_items/:id" => 'line_items#destroy'

  # match "/destroy_cart", to: "carts#destroy", via: :delete
  # match "/line_items/:id/destroy", to: "line_items#destroy"
  # match "/line_items/:id/add", to: "line_items#add"
  # match "/line_items/:id/subtract", to: "line_items#subtract"

  get "home/index"
  get "home/help"
  get "home/about"


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
