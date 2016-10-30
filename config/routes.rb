Rails.application.routes.draw do
  resources :bookings, :passengers, :flights
  root 'flight#index'
  get "search_flights" => "flights#search_flights", as: "search_flights", defaults: { format: 'js' }

end
