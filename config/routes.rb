Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'home/index', to: 'home#index'
  get 'comparador/:id', to: 'comparador#index', as: 'comparador'
  get 'comparador/:id/:id2', to: 'comparador#index', as: 'compare'
  get 'marcas', to: 'marcas#index'
  get 'carrito', to: 'cart#index'
  post 'carrito/increase' => 'cart#increase', as: 'increase_carrito'
  post 'carrito/decrease' => 'cart#decrease', as: 'decrease_carrito'

  resources :onlyphones
  root "onlyphones#index"
end

