Rails.application.routes.draw do
  devise_for :buyers, :brokers, :admins
  resources :buyers, :brokers, :admins, :users, :broker_stocks, :stocks

  root 'home#index'
  
end
