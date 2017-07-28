Rails.application.routes.draw do
  root 'home#index'

  namespace :api do
    resources :patients, only: [:show]
    resources :actions,  only: [:create]
  end
end
