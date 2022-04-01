Rails.application.routes.draw do
  # In order for namespace to work, you need to create a new folder called api under controllers folder, and move all those namespaced
  # controllers into it. Also, in each namespaced controller, you need to add Api:: in front of the controller's name:
  # class Api::CartsController < ApplicationController instead of class CartsController < ApplicationController
  namespace :api do
    resources :products, only: [:index, :show]
    resources :carts, only: [:create, :destroy, :update]
    get "/users/:user_id/carts", to: "carts#index"
    post "/signup", to: "users#create"
    get "/me", to: "users#show"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
  end

  get '*path',
      to: 'fallback#index',
      constraints: ->(req) { !req.xhr? && req.format.html? }
end