Rails.application.routes.draw do
  get 'counter/index'
  get 'contador/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'home/index', to: 'home#index'
  get 'comparador/:id', to: 'comparador#index', as: 'comparador'
  get 'comparador/:id/:id2', to: 'comparador#index', as: 'compare'
  get 'marcas', to: 'marcas#index'
  get 'carrito', to: 'cart#index'
  get 'phone/:id', to: 'onlyphones#show', as: 'phone'

  post 'onlyphones/create', to: 'onlyphones#create', as: 'create'
  post 'increment', to: 'cart#increment'
  post 'decrement', to: 'cart#decrement'

  resources :onlyphones
  root "onlyphones#index"
end

