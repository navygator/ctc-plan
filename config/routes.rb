Rails.application.routes.draw do

  resources :sections

  resources :subjects
  resources :departments
  resources :unions

  root 'home#index'
end
