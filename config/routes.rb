Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "staticpages#top"
  root "users#new"
  # get 'users/new', to: 'users#new'  ーー
  # resources :users, only: [:new, :create]
  resources :users
end
