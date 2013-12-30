Cast2dev::Application.routes.draw do
  resources :videos, only: [:show, :new, :create]

  get 'tags/:tag', to: 'home#index', as: :tag
  root 'home#index'
end
