# == Route Map
#

Rails.application.routes.draw do
  resources :primary_item_lists

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'homes#index'
  get 'setting', to: 'homes#setting' # setting_path

  resources :spends
end
