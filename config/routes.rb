Rails.application.routes.draw do
  resources :users
  resources :articles
  root 'home#index'
  get 'signup', to: 'users#new'
  #post 'users', to: 'users#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
