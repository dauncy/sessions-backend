Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:index, :create]
  resources :messages, only: [:create]
  resources :users
  mount ActionCable.server => '/cable'
end
