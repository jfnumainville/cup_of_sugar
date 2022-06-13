Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  root to: 'pages#home'
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

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  #   patch "cancel_request/:id", to: "request#cancel", as: :cancel_request
  #   patch "approved_request/:id", to: "request#approved", as: :approved_request
end
