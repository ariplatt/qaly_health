Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "users#index"
  devise_for :demographics
  resources :demographics
  devise_for :physicians
  resources :physicians
  devise_for :readings
  resources :readings
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
