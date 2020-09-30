Rails.application.routes.draw do
  devise_for :users
  root to: 'life_chart#index'
  resource only: [:index]
end
