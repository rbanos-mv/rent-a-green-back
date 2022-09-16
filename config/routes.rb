Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ('/')
  # root 'articles#index'

  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  get '/users/current', to: 'users#current'
  resources :items, only: [:index, :show, :create]
  resources :reservations, only: %i[create index show]
end
