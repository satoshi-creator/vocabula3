Rails.application.routes.draw do
  devise_for :users
  get '/' => "home#top"
  get "about" => "home#about"
  
  root 'wordbooks#index'
  resources :wordbooks do
    resources :words do
      member do
        put 'toggle_hidden'
      end
    end
  end
  
end
