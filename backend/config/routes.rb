Rails.application.routes.draw do
  resources :collections, only: [:index, :show, :create, :update, :destroy]
end
