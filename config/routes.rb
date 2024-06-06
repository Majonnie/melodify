Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root 'pages#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'pages/index'

  resources :users, only: [:show]
  resources :instruments
  resources :exercises do
    member do
      get 'next_instrument/:instrument_id', to: 'exercises#next_instrument', as: 'next_instrument'
      get 'previous_instrument/:instrument_id', to: 'exercises#previous_instrument', as: 'previous_instrument'
    end
  end
end
