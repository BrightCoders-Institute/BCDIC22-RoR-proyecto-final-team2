Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'home/index', to: 'home#index'
  get 'comparador/:id', to: 'comparador#index'
  get 'marcas', to: 'marcas#index'
  get 'about-us', to: 'about_us#index'
  resources :onlyphones

  root "onlyphones#index"
end
