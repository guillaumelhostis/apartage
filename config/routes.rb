Rails.application.routes.draw do
  get 'rentals/new'
  devise_for :users
  root to: "pages#home"
  resources :flats do
    resources :rentals
  end

  # resources :rentals
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
