Cast2dev::Application.routes.draw do
  resources :videos, only: [:show, :new, :create]
  root 'home#index'
end
