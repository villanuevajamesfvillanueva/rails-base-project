Rails.application.routes.draw do
  devise_for :buyers, :brokers, :admins
  resources :buyers, :brokers, :admins, :users, :broker_stocks, :buyer_stocks, :stocks
  get '/transacts/buyer/:id', to: 'transacts#show_buyer_transact', as: 'buyer_transact'
  get '/transacts/broker/:id', to: 'transacts#show_broker_transact', as: 'broker_transact'

  root 'home#welcome'
end
