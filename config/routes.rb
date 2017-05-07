Rails.application.routes.draw do

  get '/' => 'pages#home'

  resources :products
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :products do
    resources :reviews, only: [:show, :create, :destroy, :edit, :update]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
