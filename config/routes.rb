Rails.application.routes.draw do
  root "pages#home"

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'

  resources :users, only: [:new, :create, :show] do
    resources :tanks, only: [:new, :create, :show]
  end

  resources :tanks, only: [:show] do
    resources :fish
  end

  resources :breeds, only: [:new, :create, :show]
end
