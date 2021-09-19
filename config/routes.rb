Rails.application.routes.draw do
  resources :todos, only: [:new, :index, :create, :destroy]
  resources :pokemons, only: [:new, :index, :create, :show]
  root to: 'static_pages#new'
  # resources :users, only: %i[show]
  get 'users/stamp', to: 'users#stamp'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
end
