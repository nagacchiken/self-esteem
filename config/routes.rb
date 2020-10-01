Rails.application.routes.draw do
  devise_for :users
  root to: 'life_charts#index'
  resource only: [:index]
end
