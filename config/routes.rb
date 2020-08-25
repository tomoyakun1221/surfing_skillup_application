Rails.application.routes.draw do
  devise_for :users

  root 'users#top_page'

  resources :users do
    member do
      get 'edit_user_info'
      patch 'update_user_info'
    end
  end

  resources :image_videos

  scope :api, { format: 'json' } do
    resources :image_videos do
      get :search, on: :collection
    end
  end

  resources :favorites

  get '/users' => redirect("users/sign_in")
  get '/users/password' => redirect("users/password/new")

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
