Rails.application.routes.draw do
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

  #   patch "cancel_request/:id", to: "request#cancel", as: :cancel_request
  #   patch "approved_request/:id", to: "request#approved", as: :approved_request
end
