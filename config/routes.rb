Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # member defines routes for a single instance of the doctors resource so I can nest instead of doing:
  # delete 'doctors/:doctor_id/patients/:patient_id/appointments', to: 'doctors#destroy'
  resources :doctors, only: [:show] do
    member do
      delete 'patients/:patient_id', to: 'doctors#destroy'
    end
  end

  resources :patients, only: [:index]

end
