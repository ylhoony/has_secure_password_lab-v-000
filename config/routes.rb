Rails.application.routes.draw do

  root to: "welcome#home"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create]
end
