Rails.application.routes.draw do
  devise_for :users

  resources :home, only: [:index]
  resources :workout, only: [:index] do
    collection do
      post :create_workout_sessions
      get :workout_profile
    end
  end
  resources :groups, only: [:create, :show] do
    member do
      post :create_post
      post :add_member
    end
  end
  resources :dashboard, only: [:index] do
    collection do
      post :send_friend_request
      post :accept_friend_request
    end
  end

  root 'home#index'
  get "/*path", to: 'home#index'
end
