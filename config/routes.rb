Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :messages, only: [:index, :show, :create, :destroy]
  resources :users
  mount ActionCable.server => '/cable'
end
