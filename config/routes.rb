Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'category', to: 'coffees#category'
  get 'search', to: 'coffees#search'
  resources :coffees, only: [:index, :show] do
    resources :reviews, only: [:create, :new, :update, :edit]
  end

  resources :users, only: [:index, :show, :update] do
    member do
      post :follow
      post :unfollow
    end
  end
  resources :reviews, only: [:index, :destroy]
end
