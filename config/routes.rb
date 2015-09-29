Rails.application.routes.draw do
  devise_for :users

  resources :itineraries
end
