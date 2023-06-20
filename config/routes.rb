Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :flats
  resources :quizzs
  get 'pages/compatibily', to: 'pages#compatibily'
  get 'pages/senior_dashboard', to: 'pages#senior_dashboard'
end
