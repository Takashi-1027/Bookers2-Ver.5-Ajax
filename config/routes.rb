Rails.application.routes.draw do
  devise_for :users

  root :to => "homes#top"
  get 'home/about' => 'homes#about'
  # root to: 'homes#top'
  resources :books,only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
    # View-bookの中にfavoritesを作るからresouces :booksの中に入れている。
  end
  resources :users, only: [:show,:index,:edit,:update]
end
  # get 'book_comments/create'
  # get 'book_comments/destroy'
  # get 'favorites/create'
  # get 'favorites/destroy'