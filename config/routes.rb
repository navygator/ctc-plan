Rails.application.routes.draw do


  devise_for :users
  resources :users

  resources :children do
    resources :documents
  end
  
  resources :parents
  resources :people
  resources :document_types
  resources :age_categories
  resources :schools
  resources :status_types
  resources :time_of_days
  resources :social_statuses
  resources :teachers
  resources :groups
  resources :studying_years
  resources :sections
  resources :subjects
  resources :departments
  resources :unions

  root 'home#index'
end
