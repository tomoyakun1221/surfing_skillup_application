Rails.application.routes.draw do
  devise_for :users

  root 'users#top_page'

  resources :users

  get '/users' => redirect("users/sign_in")
  get '/users/password' => redirect("users/password/new")

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
