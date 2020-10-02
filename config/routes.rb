Rails.application.routes.draw do
  devise_for :users
  root to: 'life_charts#index'
  resource :life_charts, only: [:index]
  post '/life_charts/guest_sign_in', to: 'life_charts#new_guest'
end
