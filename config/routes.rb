Rails.application.routes.draw do
  resources :items
  post "add_to_list", :to => "items#add_to_list", :as => "add_to_list"
  get "store", :to => "invoices#store", :as => "store"

  resources :invoices
#  get "add_item_to_invoice/:invoice_id/:item_id", :to => "invoices#add_item_to_invoice", :as => "add_item_to_invoice"
  get "toggle_item_in_invoice/:item_id", :to => "invoices#toggle_item_in_invoice", :as => "toggle_item_in_invoice"
  get "toggle_item_in_invoice", :to => "invoices#toggle_item_in_invoice", :as => "toggle_item_in_invoice_base"

  resources :payments, :debts
  get "payment_history", :to => "payments#history", :as => "payment_history"

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  } 
  devise_scope :user do
    get "users/dashboard", :to => "users/sessions#dashboard", :as => "dashboard_sessions"
    get "users/:id", :to => "users/sessions#show", :as => "user"
    root "users/sessions#dashboard"
  end

  #resources :debts, :users
    
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'users/sessions#dashboard'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
