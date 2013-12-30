Cast2dev::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :videos, only: [:show, :new, :create]

  get 'tags/:tag', to: 'home#index', as: :tag
  root 'home#index'
end
