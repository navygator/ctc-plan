Rails.application.routes.draw do

  resources :people

  resources :groups

  resources :studying_years

  resources :sections

  resources :subjects
  resources :departments
  resources :unions

  root 'home#index'
end
