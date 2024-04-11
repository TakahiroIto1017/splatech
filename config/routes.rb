Rails.application.routes.draw do
  devise_for :users
  root to: 'info#index'
  resources :profiles, only: [:index, :create, :show]
end
