Rails.application.routes.draw do
  devise_for :users
  get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books

  root to: 'homes#top'

end