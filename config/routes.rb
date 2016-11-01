Rails.application.routes.draw do
  resources :flights, only: [:index]
  resources :users, only: [:create] do
    member do
      get 'bookings'
    end
  end
  resources :bookings, except: [:index] do
    collection do
      get 'manage'
      get 'find'
    end
  end
  root 'flights#home'

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
