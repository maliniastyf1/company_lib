Rails.application.routes.draw do

  resources :books
  devise_for :users
  root 'static#homepage'
end
