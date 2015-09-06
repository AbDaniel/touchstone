Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :exams, only: [:index, :show]
end
