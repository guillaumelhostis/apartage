Rails.application.routes.draw do
  get 'your_spaces/new'
  get 'rentals/new'
  devise_for :users
  root to: "pages#home"
  get 'pages/my_dashboard'


  resources :your_spaces

  resources :rentals

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
