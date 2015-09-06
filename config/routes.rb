Rails.application.routes.draw do
  get 'exam/start'
  get 'exam/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
