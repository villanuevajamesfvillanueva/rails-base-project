Rails.application.routes.draw do
  devise_for :users
  
  resources :brokers
  resources :buyers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
