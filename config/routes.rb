EtiquetAR::Application.routes.draw do

  resources :localizations

  resources :collections do
    resources :profiles
    resources :qrs do
      resources :resources #, :only=>[:new, :create]
      resources :localizations
    end
  end

  #Resources can only be added when they belong to a QR

#  resources :resources, :except=>[:new, :create]

  resources :users
  #resources :profiles
  resources :rqr

  resources :sessions, only: [:new, :create, :destroy]
  root to: 'static_pages#home'

  ####QR_CODES ROUTES
  match '/qrs/index', to: 'qrs#new'
  match '/qrs/:id/download', to: 'qrs#download'  
  match '/go/:id', to: 'qrs#go'
  match '/go/:qr_id/:res_id', to: 'resources#go'
  match '/comments/:id', to: 'resources#comments'
  match '/comments/:id/post', to: 'resources#post_comment' 
  match '/comments/visible/:id', to: 'resources#comment_toggle_visibility'

  ####USERS ROUTES
  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  #The use of via: :delete for the signout route, which indicated that it should be invoked using an HTTP DELETE request
  match '/signout', to: 'sessions#destroy'
  match '/qrs/:id/download', to: 'qrs#download'
#Adding this to list the resources per each qr
  match '/qrs/:id/index_resources', to: 'users#qr_resources'

  root to: 'static_pages#home'
  
  match '/help', to: 'static_pages#help'
  match '/about', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'


  match '/home_signed_in', to: 'static_pages#home_signed_in'
  match '/qrcode', to: 'static_pages#qrcode'

  ####RESOURCES ROUTES
  match '/resources/index', to: 'resources#list_by_qr_id'


  #root to: 'static_pages#home'
  

  #get "static_pages/home"
  #get "static_pages/help"
  #get "static_pages/about"
  #get "static_pages/contact"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
