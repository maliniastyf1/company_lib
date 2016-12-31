Rails.application.routes.draw do

  resources :books
  resources :rents, only: [:new, :create, :index]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'static#homepage'

end
