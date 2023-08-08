Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :doctors, only: [:show] do
    member do
      delete 'patients/:patient_id', to: 'doctors#destroy'
    end
  end

end
