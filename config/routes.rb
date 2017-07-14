Rails.application.routes.draw do
  devise_for :users

  resources :payment, only: [:create]
end
