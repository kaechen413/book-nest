Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'my_books', to: 'books#my_books', as: :my_books
  get 'rented_books', to: 'books#rented', as: :rented_books

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/book_offers/:id", to: "book_offers#show", as: "show"


  # Defines the root path route ("/")
  # root "posts#index"
end
