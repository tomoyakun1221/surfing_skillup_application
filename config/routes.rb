Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  get '/users' => redirect("users/sign_in")

  get '/users/password' => redirect("users/password/new")

  # get '/users/sign_in', to: 'users#sigh_in'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
