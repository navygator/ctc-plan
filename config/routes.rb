Rails.application.routes.draw do
  resources :levels

  resources :grades

  resources :achievement_types

  devise_for :users
  resources :users

  resources :children do
    resources :documents
    resources :achievements
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
  
  resources :groups do
    resources :achievements
  end
  resources :studying_years
  
  resources :sections do
    resources :achievements
  end
  resources :subjects
  resources :departments do
  end
  resources :unions

  root 'home#index'
end
