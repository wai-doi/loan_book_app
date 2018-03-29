Rails.application.routes.draw do
  resources :loans, except: [:new, :show]
  root to: 'loans#index'
end
