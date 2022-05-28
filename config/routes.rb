Rails.application.routes.draw do
    root to: 'pages#home'

    devise_for :users do
        resources :requests, only: [:index, :show]
        resources :items
        resources :reviews
    end


    resources :items do
        resources :requests, only: [:new, :create]
        resources :reviews
    end

    resources :requests do
        resources :messages, only: [:new, :create]
    end

#   patch "cancel_request/:id", to: "request#cancel", as: :cancel_request
#   patch "approved_request/:id", to: "request#approved", as: :approved_request

end
