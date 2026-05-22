Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/new'
  get 'bookings/edit'
  root "bookings#index"
  get "up" => "rails/health#show", as: :rails_health_check

  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get  "/signup", to: "users#new"
  post "/signup", to: "users#create"

  resources :users, only: [:new, :create]

  resources :buses

  resources :routes

  resources :buses do
   resources :schedules
  end


 resources :schedules do
  resources :bookings, only: [:new, :create]
 end

resources :bookings

end