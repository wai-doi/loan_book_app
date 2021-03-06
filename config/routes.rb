Rails.application.routes.draw do
  resources :loans, except: [:new, :show]
  resources :users
  root to: 'loans#index'
  get '/all', to: 'loans#show_all'
  put '/swich/:id', to: 'loans#swich'
end
