Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'home/index', to: 'home#index'
  get '/comparador', to: 'comparador#index'

  root "onlyphones#index"
end
