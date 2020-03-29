Rails.application.routes.draw do
  get 'searches/result'
  root 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :destricts
end
