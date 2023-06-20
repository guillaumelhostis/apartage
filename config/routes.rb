Rails.application.routes.draw do
  get 'your_spaces/new'
  get 'rentals/new'
  devise_for :users
  root to: "pages#home"
  get 'pages/my_dashboard', to: 'pages#my_dashboard', as: 'my_dashboard'

  get 'pages/accept_rental', to: 'pages#accept_rental'
  get 'pages/refuse_rental', to: 'pages#refuse_rental'


  resources :flats do
    resources :your_spaces, only: [:new, :create]
    resources :rentals, only: [:new, :create]
  end
  resources :your_spaces, only: [:edit, :update]
  resources :rentals, only: [:show, :edit, :update, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
