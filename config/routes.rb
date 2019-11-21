Rails.application.routes.draw do
  resources :email
  devise_for :users
  root to: "email#index"
  get "index", to: "home#index"
  get "destroy_all", to: "email#destroy_all"
  resources :tasks, except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
