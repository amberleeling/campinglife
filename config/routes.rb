Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"

  resources :equipments, only: [:index, :show, :new, :create]

  resources :bookings, only: [:create] do
    member do
      patch :accept
      patch :decline
  end
  end

  get "/client/bookings", to: "client_bookings#index"
  get "/owner/equipments", to: "owner_equipments#index"
  get "/owner/bookings", to: "owner_bookings#index"

end
