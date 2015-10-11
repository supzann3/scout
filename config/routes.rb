Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}
  root 'home#index'
  resources :itineraries
  resources :search
  resources :users
end
