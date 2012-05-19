Rc::Application.routes.draw do
  # products
  get "products/new"
  post "products/create"
  match 'products/:id' => 'products#index'
  match 'love/:id' => 'products#love'

  # home
  get "home/index"
  match "home/:index_type/:id" => 'home#person_index', via: :get
  
  # user
  get '/users/newicon'
  post '/users/seticon'
  match 'login' => 'users#login', :via => :get
  match 'auth' => 'users#auth', :via => :post
  match 'logout' => 'users#logout', :via => :get
  resources :users

  # comments
  match 'comments/new/:id' => 'comments#new', :via => :post
  
  # relationship
  match 'relationships/contact/:to_id' => 'relationships#contact', via: :get
  match 'relationships/cancel_contact/:to_id' => 'relationships#cancel', via: :get
  
  # post
  post 'posts/new'

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
