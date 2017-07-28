Rails.application.routes.draw do
  root 'home#index'

  namespace :api do
    resources :patients, only: [:show]
  end
end
