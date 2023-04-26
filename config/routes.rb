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
  get 'about-us', to: 'about_us#index'
  get 'seller', to: 'seller#index'
  get 'seller/:id', to: 'seller#index', as: 'sell'
  get 'carrito', to: 'cart#index'
  get 'phone/:id', to: 'onlyphones#show', as: 'phone'
  get 'onlyphones/create/:id', to: 'onlyphones#create', as: 'create'
  get 'carrito/delete', to: 'cart#delete', as: 'delete_cart'
  get 'carrito/update', to: 'cart#update', as: 'update_cart'

  post 'increment', to: 'cart#increment'
  post 'decrement', to: 'cart#decrement'
  post 'add_phone', to: 'seller#add_phone', as: 'add_phone'
  
  delete 'seller/:id', to: 'seller#destroy', as: 'destroy_phone'

  resources :onlyphones
  root "onlyphones#index"
end
