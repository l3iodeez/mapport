Rails.application.routes.draw do
  resources :buildings

  resources :spaces

  resources :materials

  resources :reports

  resources :customers

  get 'admin/index'

  devise_for :users, :path_prefix => 'portal'
  
  resources :admin
  


    resources :ahera, only: [:index, :show]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'welcome#index'
 
  resources :welcome, only: [:index, :show]
  
  get 'admin/:id/approve'=> 'admin#approve_user', as: 'approve_user'
  #get 'admin' => 'admin#index'

  get '/reports/download/:id' => 'reports#download', as: 'reports_download'
  

  get '/admin' => 'admin#index', as: 'users'
  post  '/admin/new' => 'admin#create'
  get '/admin/new' => 'admin#new', as: 'new_user'
  get '/admin/:id/edit' => 'admin#edit', as: 'edit_user'
  get '/admin/:id' => 'admin#show', as: 'user'
  patch '/admin/:id' => 'admin#update'
  put '/admin/:id' => 'admin#update'
  delete '/admin/:id' => 'admin#destroy'
   
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
