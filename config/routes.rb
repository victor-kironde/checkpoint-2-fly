Rails.application.routes.draw do
  resources :passengers, :flights
  resources :users, only: [:create] do
    member do
      get "bookings"
    end
  end
  resources :bookings, except: [:index] do
    collection do
      get "manage"
      get "find"
    end
  end
  root 'flight#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get "search_flights" => "flights#search_flights", as: "search_flights", defaults: { format: 'js' }

end
