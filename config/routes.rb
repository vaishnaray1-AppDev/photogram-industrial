Rails.application.routes.draw do
  #need to have root for devise
  root to: "photos#index"

  
  

  devise_for :users
  resources :likes
  resources :follow_requests
  resources :comments
  resources :photos
  #resources :users, only: :show


  get "/:username/liked" => "photos#liked", as: :liked_photos
  get "/:username/feed" => "photos#feed", as: :feed
  get "/:username/followers" => "users#followers", as: :followers
  get "/:username/following" => "users#leaders", as: :leaders

  get "/:username" => "users#show", as: :user

 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
end
