Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root 'pages#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'pages/index'
end
