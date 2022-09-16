Rails.application.routes.draw do
  get 'reservations/create'
  get 'reservations/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ('/')
  # root 'articles#index'

  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  get '/users/current', to: 'users#current'
  resources :items, only: %i[create destroy index show]
  resources :reservations, only: %i[create index show]
end
