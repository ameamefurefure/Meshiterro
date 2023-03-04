Rails.application.routes.draw do
  # get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"

  # get 'postimages/new'
  # get 'postimages/index'
  # get 'postimages/show'
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  
  # get 'users/show'
  # get 'users/edit'
  resources :users, only: [:show,:edit, :update]
end