Rails.application.routes.draw do
  
  resources :moves do
    resources :boxes
  end
  
  root 'moves#index'
end
