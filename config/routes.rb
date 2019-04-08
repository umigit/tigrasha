Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts
  resources :users, only: [:show]
    get 'users/:id/sightings' => 'users#sightings'
    get 'users/:id/posts' => 'users#posts'
  resources :sightings
end
