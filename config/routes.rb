Rails.application.routes.draw do
  resources :users
  get 'staticpages/top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "staticpages#top"
end
