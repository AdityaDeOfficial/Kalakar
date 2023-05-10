Rails.application.routes.draw do
  devise_for :users
  root to: "mangas#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :mangas do
    member do
      post 'favorite'
      post 'unfavorite'
    end
    get 'tags/:tag', to: 'mangas#index', as: :tag
    resources :manga_reviews, only: [:create, :update, :destroy]
    resources :chapters do
      resources :chapter_reviews, only: [:create, :update, :destroy]
    end
  end

  resources :dashboard, only: [:index]
end
