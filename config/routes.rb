Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
  devise_for :users
  get 'home/about' => 'homes#about'
  root to: 'homes#top'

  resources :users, only: [:show,:index,:edit,:update]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    # View-bookの中にfavoritesを作るからresouces :booksの中に入れている。
  end
end

  # get 'favorites/create'
  # get 'favorites/destroy'