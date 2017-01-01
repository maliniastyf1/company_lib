Rails.application.routes.draw do

  resources :books
  resources :rents, only: [:create, :index]
  devise_for :users
  root 'static#homepage'
  get 'rents/:book_id', :to => 'rents#show_book_to_rent'

end
