Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
  resources :banks
  resources :suppliers do
    member do
      delete 'delete_account/:account_id', to: 'suppliers#delete_account', as: 'delete_account'
      get 'edit_account/:account_id', to: 'suppliers#edit_account', as: 'edit_account'
      patch 'update_account/:account_id', to: 'suppliers#update_account', as: 'update_account'
    end
  end
end
