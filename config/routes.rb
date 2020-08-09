Rails.application.routes.draw do
  get 'session/new'
  root 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get     "login"    => "sessions#new"
  post    "login"    => "sessions#create"
  delete  "logout"   => "sessions#destroy"
  get 'users/sign_up' => 'users#new'
  post 'users/sign_up' => 'users#create'
  resources :users, only: [:show]
end
