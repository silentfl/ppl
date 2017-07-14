Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :payment, only: [:create]
  resources :user_cabinet, only: [:index]

  root 'user_cabinet#index'
end
