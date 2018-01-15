Rails.application.routes.draw do
  resources :cards
  resources :lists
  
  root 'lists#index'
end
