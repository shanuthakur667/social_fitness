Rails.application.routes.draw do
  devise_for :users

  resources :home, only: [:index]
  resources :groups, only: [:create, :show]
  resources :dashboard, only: [:index] do
    collection do
      post :send_friend_request
      post :accept_friend_request
    end
  end

  root 'home#index'
  get "/*path", to: 'home#index'
end
