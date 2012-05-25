Arc2::Application.routes.draw do
  get "reasons/show"

  get "categories/index"

  root :to => "pages#home"
  resources :category_relationships
  resources :categories
  resources :sessions
  resources :users
  resources :pages
  resources :temp_activities
  
  resources :ts do
    member do 
      get :choose, :tutorial1, :tutorial2
    end
  end
  
  resources :reasons do
    member do 
      get :showquestion
    end
  end
  
  match "/thanks", to: "pages#thanks"
  match "/feedback2", to: "pages#feedback2"
  match "/emailus", to: "pages#emailus"
  match "/survey4", to: "pages#survey4"
  match "/survey3", to: "pages#survey3"
  match "/feedback1", to: "pages#feedback1"
  match "/survey2", to: "pages#survey2"
  match "/topic_choice", to: "pages#topic_choice"
  match "/survey1", to: "pages#survey1"
  match '/political_choice',  to: 'pages#political_choice'
  match '/home',  to: 'pages#home'
  match "/liberal", to: "pages#liberal"
  match "/conservative", to: "pages#conservative"
  match "/independent", to: "pages#independent"
  match "/temp", to: "pages#temp"

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
