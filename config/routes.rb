Rails.application.routes.draw do

  #devise_for :admins
  devise_for :doctors, controllers: { registrations: "registrations" }

  resources :doctors, :only => [] do
    resources :patients do
      resources :visits
    end
  end



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


  authenticated :doctor do
    root to: 'patients#index_for_doctor', as: :authenticated_root
  end
  root to: redirect('/doctors/sign_in')

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Doctor)
      logger.debug("routes")
      "/"

    else
      super
    end
  end

  mount RailsAdmin::Engine => '/manage', as: 'rails_admin'

  get 'static_pages/help'

  get 'static_pages/about'



    get 'medicines/search/name', to: 'medicines#search_for_name',    as: 'search_medicine_names'
    get '/medicines/medicine_list' => 'medicines#medicine_list'
    get '/medicines' => 'medicines#index'
    get '/diagnoses' => 'diagnoses#index'
    get '/doctors/:doctor_id/visits', to: 'visits#index', as: 'doctor_visits'
    get '/doctors/:doctor_id/visits/build_report', to: 'visits#build_report', as: 'doctor_visits_build_report'
    get '/doctors/:doctor_id/visits/all_records', to: 'visits#all_records', as: 'doctor_visits_all_records'
    post '/doctors/:doctor_id/visits/add_to_report' => 'visits#add_to_report', as: 'doctor_visits_add_to_report'
    get '/doctors/:doctor_id/patients/:patient_id/generate_pdf' => 'patients#generate_pdf', as: 'doctor_patient_generate_pdf'
    get '/doctors/:doctor_id/patients/:patient_id/visits/:visit_id/generate_examination_pdf' => 'visits#generate_examination_pdf', as: 'doctor_patient_visit_generate_examination_pdf'
    get '/doctors/:doctor_id/visits/generate_pdf' => 'visits#generate_pdf', as: 'doctor_visits_generate_pdf'
    get '/doctors/:doctor_id/visits', to: 'visits#repeated_items_popup', as: 'doctor_visits_repeated_items_popup'
    get '/doctors/:doctor_id/patients/:patient_id/visits/new/add_final_diagnosis' => 'visits#add_final_diagnosis', as: 'doctor_patient_visits_new_add_final_diagnosis'
    get '/doctors/:doctor_id/patients/:patient_id/visits/new/add_dispanserisation' => 'visits#add_dispanserisation', as: 'doctor_patient_visits_new_add_dispanserisation'

    get '*path', :to => 'application#raise_not_found!'

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
