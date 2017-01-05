Rails.application.routes.draw do

  root 'home#index'

  resources :spots, only: [:index]

end
