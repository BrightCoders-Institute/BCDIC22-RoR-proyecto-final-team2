Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'home/index', to: 'home#index'
  resources :onlyphones

  # Defines the root path route ("/")
  root "onlyphones#index"
end
