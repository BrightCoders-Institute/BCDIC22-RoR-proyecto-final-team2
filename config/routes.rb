Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'comparador/:id', to: 'comparador#index'
  get 'marcas', to: 'marcas#index'
  resources :onlyphones

  root "onlyphones#index"
end

