# == Route Map
#

Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'

  resources :spends
end
