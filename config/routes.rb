Rails.application.routes.draw do

  resources :books
  resources :rents, only: [:new, :create, :index]
  devise_for :users
  root 'static#homepage'

end
