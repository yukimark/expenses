# == Route Map
#

Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  get 'setting', to: 'homes#setting' # setting_path

  resources :spends
end
