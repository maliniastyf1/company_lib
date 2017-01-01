Rails.application.routes.draw do

  resources :books
  resources :rents, only: [:create, :index]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'static#homepage'
  get 'rents/:book_id', :to => 'rents#show_book_to_rent'
  put 'books/:book_id/return_book', :to => 'books#return_book'

end
