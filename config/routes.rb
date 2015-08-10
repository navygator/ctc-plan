Rails.application.routes.draw do

  resources :time_of_days

  resources :social_statuses

  resources :teachers

  resources :parents

  resources :children

  resources :people

  resources :groups

  resources :studying_years

  resources :sections

  resources :subjects
  resources :departments
  resources :unions

  root 'home#index'
end
