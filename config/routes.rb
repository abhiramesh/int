Rails.application.routes.draw do
  
  resources :candidates
  resources :firms
  resources :profiletags
  resources :tags
  resources :profiles
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
    get "join" => "devise/registrations#new"
  end

  get '/add_profile', to: 'profiles#add_profile', as: "add_profile"
  
  get '/get_schools', to: 'profiles#get_schools'

  get '/admin_dash/:name', to: 'firms#admin_dash', as: "admin_dash"

  post '/upload_resume', :to => "profiles#upload_resume"

  post '/upload_picture', :to => "profiles#upload_picture"

  post '/update_tags', :to => "profiles#update_tags"

  post '/update_position', :to => "candidates#update_position"

  post '/dash_filter',:to => "firms#dash_filter"

  get '/apply/:name', :to => "firms#apply"

  get '/download_book/:firm_id', :to => "firms#download_book", as: "download_book"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

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
