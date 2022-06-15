Rails.application.routes.draw do
#   get 'errors/not_found'
#   get 'errors/internal_server_error'
  root to: 'pages#home'

  get '/404' => "errors#not_found"
  get '/500' => "errors#internal_server_error"

  get '/landing' => 'pages#landing'

  devise_for :users do
    resources :requests, only: %i[index show]
    resources :items
    resources :reviews
  end

  resources :items do
    resources :requests, only: %i[new create update]
    resources :reviews, only: :create
  end

  resources :requests

  resources :chatrooms, only: %i[create show] do
    resources :messages, only: :create
  end

  resources :categories, only: :index
end
