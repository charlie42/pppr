Rails.application.routes.draw do

  resources :medicines
  resources :examinations
  resources :treatment_factors
  resources :diagnoses
  resources :specialists
  resources :abdominal_conditions
  resources :liver_conditions
  resources :effleurage_options
  resources :subcutanious_fat_options
  resources :postural_pose_options
  resources :general_state_options
  resources :constitution_options
  devise_for :doctors
  root 'static_pages#home'

  get 'static_pages/help'

  get 'static_pages/about'


    resources :doctors do
      resources :patients do
        resources :visits
      end
    end

    get '/doctors/:doctor_id/visits', to: 'visits#index', as: 'doctor_visits'
    get '/doctors/:doctor_id/visits/build_report', to: 'visits#build_report', as: 'doctor_visits_build_report'
    post '/doctors/:doctor_id/visits/add_to_report' => 'visits#add_to_report', as: 'doctor_visits_add_to_report'
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
