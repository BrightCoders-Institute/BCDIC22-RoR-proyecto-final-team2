Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'home/index', to: 'home#index'
  get 'comparador/:id', to: 'comparador#index', as: 'comparador'
  get 'comparador/:id/:id2', to: 'comparador#index', as: 'compare'
  get 'marcas', to: 'marcas#index'
  get 'seller', to: 'seller#index'
  get 'seller/:id', to: 'seller#index', as: 'sell'
  get 'carrito', to: 'cart#index'

  post 'add_phone', to: 'seller#add_phone', as: 'add_phone'
  delete 'seller/:id', to: 'seller#destroy', as: 'destroy_phone'
  
  resources :onlyphones
  root "onlyphones#index"
end
