Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :equipments, only: [:index, :show, :new, :create] do
    resources :bookings, only: :create
  end

  resources :bookings, only: [:create, :destroy] do
    member do
      patch :accept
      patch :decline
    end
  end

  namespace :client do
    resources :bookings, only: :index
  end

  namespace :owner do
    resources :bookings, only: :index
    resources :equipments, only: :index
  end


  # get "/owner/equipments", to: "owner_equipments#index"
  # get "/owner/bookings", to: "owner_bookings#index"
end
