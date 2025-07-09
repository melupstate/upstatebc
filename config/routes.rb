Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "homepages#index"

  # BEGIN navigation 
  
  get 'partner_pages/index',to: "partner_pages#index",as: "partner_pages"
  get 'contact_pages/index',to: "contact_pages#index",  as: "contact_pages"
  get 'about_pages/index',to: "about_pages#index",as: "about_pages"
  get 'about_pages/about_faq_pages',to: "about_pages#about_faq_pages",as: "about_faq_pages"

 
  # END navigation

  # BEGIN LOGIN
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  # END LOGIN

  #BEGIN USERS
  resources :users, except: [:show]
  get 'createuser_38923489d8234k234', to: 'users#new'

  #END USERS

  ## BEGIN PDI FORMS
  get 'request_counseling',to: "pdi_forms#request_counseling" 
  resources :pdi_forms ,except: [:show]
  get 'pdi_forms/:id/edit_form1',to: 'pdi_forms#edit_form1',as: 'edit_form1'
  resources :pdi_form_datum ,except: [:show]
  post 'populate_category',to: "pdi_forms#populate_category"

  ## END PDI FORMS

  ## BEGIN COMMON TOPICS
  get 'common_topics',to: "common_topics#index"
  ## END COMMON TOPICS
  
end
