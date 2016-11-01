Rails.application.routes.draw do
  resources :bookings, :passengers, :flights
  root 'flight#index'
  get 'signup' => 'users#new'
  resources :users, except:[:new]
  get "search_flights" => "flights#search_flights", as: "search_flights", defaults: { format: 'js' }

end
