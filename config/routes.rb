Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show, :edit, :update]

  resources :tasks, only: [:new, :create, :show, :edit, :update, :index]

  resources :goings, only: [:new, :create, :show, :edit, :update, :index]

  resources :comments, only: [:new, :create, :show, :edit, :update]

  root to: "top#index"

end
