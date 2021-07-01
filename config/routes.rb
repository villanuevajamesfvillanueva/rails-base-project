Rails.application.routes.draw do
  devise_for :buyers, :brokers, :admins
  resources :buyers, :brokers, :admins, :users, :broker_stocks, :buyer_stocks, :stocks
  resources :transacts


  root 'home#welcome'
end
