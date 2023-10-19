Rails.application.routes.draw do
  get 'users/new'
  get 'users/index'
  get 'users/show'
  get 'users/logout'
  get "home", to:"users#home"
  get "new", to:"users#new"
  get "admin", to:"users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users
end

