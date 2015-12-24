Rails.application.routes.draw do
  
  resources :moves
  
  root 'moves#index'
end
