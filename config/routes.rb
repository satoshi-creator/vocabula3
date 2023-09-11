Rails.application.routes.draw do
  devise_for :users
  get '/' => "home#top"
  get "about" => "home#about"
  
  root 'wordbooks#index'
  resources :wordbooks do
    resources :words
  end
  
end
