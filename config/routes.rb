# == Route Map
#

Rails.application.routes.draw do
  root 'homes#index'

  resources :spends
end
