Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'home/index', to: 'home#index'
  get 'comparador/:id', to: 'comparador#index', as: 'comparador'
  get 'comparador/:id/:id2', to: 'comparador#index', as: 'compare'

  root "onlyphones#index"
end
