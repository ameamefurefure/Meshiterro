Rails.application.routes.draw do
  # get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "homes#top"
  devise_for :users
  
  # get 'postimages/new'
  # get 'postimages/index'
  # get 'postimages/show'
  resources :post_images, only: [:new, :index, :show]
  
  get "homes/about" => "homes#about", as: "about"
end
