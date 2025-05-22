Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root to: "books#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'book_offers/search', to: 'book_offers#search', as: :search_book_offers

  resources :books, only: [:index, :show] do
    resources :book_offers, only: [:new, :create] do
      resources :bookings, only: [:new, :create]
    end
  end

  resources :bookings, only: [:index, :edit, :update]

  namespace :owner do
    resources :bookings, only: [:index, :update]
    resources :book_offers, only: :index
  end
  get "up" => "rails/health#show", as: :rails_health_check

end
