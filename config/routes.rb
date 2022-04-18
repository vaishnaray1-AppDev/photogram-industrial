Rails.application.routes.draw do
  #need to have root for devise
  root to: "photos#index"

  
  

  devise_for :users
  resources :likes
  resources :follow_requests
  resources :comments
  resources :photos
  resources :users, only: :show
  get "/:username" => "users#show"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
end
