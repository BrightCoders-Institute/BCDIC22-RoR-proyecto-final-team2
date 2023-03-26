Rails.application.routes.draw do
  devise_for :users
  get 'comparador/:id', to: 'comparador#index'

  root "onlyphones#index"
end
