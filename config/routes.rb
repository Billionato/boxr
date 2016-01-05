Rails.application.routes.draw do
  
  devise_for :users
  # I have to find a better way to do the following routing:
  # a) This code block 
  resources :moves do
    resources :boxes, only: [:new, :create]
  end
  resources :boxes, only: [:show, :edit, :update, :destroy]
  
  # b) This code block
  resources :boxes, except: [:new, :show, :create, :edit, :update, :destroy] do
    resources :items, only: [:new, :create]
  end
  resources :items, only: [:show, :edit, :update, :destroy]
  
  root 'moves#index'
end
