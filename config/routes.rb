Rails.application.routes.draw do

  root to: "application#hello"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"

  resources :users
end
