Rails.application.routes.draw do

  get "/login" => "users#login"

  post "/authenticate_login" => "users#authenticate_login"

  get "/users" => "users#index"

  get "/users/new" => "users#new"

  get "/delete_profile" => "users#delete"

  delete "/delete_profile" => "users#confirm_delete"

  get "/edit_profile" => "users#edit"

  put "/users/:id" => "users#save_edit"

  get "/users/:user_id/stories" => "stories#index"

  get "/new_story" => "stories#new"

  post "/users/:user_id/stories" => "stories#new_save"

  delete "/delete_story" => "stories#delete"

  get "/edit_story" => "stories#edit"

  put "/users/:user_id/stories/:id" => "stories#edit_save"

  get "/users/:user_id/stories/:id" => "stories#show"

  get "/users/:id" => "users#show"

  post "/users" => "users#save_new"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
