Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "staticpages#top"
  # get 'users/new', to: 'users#new'  ー
  resources :users, only: [:new, :create]
end
