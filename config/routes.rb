Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace,
        defaults: { format: :jsonapi } do
    scope module: "api/v1", as: "api" do
      resources :demographics_infos

      resources :physician_infos

      resources :reading_for_patients

      resources :demographics

      resources :users
    end
    mount VandalUi::Engine, at: "/vandal"
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "reading_for_patients#index"
  resources :demographics_infos
  resources :physician_infos
  resources :reading_for_patients
  devise_for :demographics
  resources :demographics
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
