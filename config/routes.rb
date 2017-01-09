Rails.application.routes.draw do

  root 'home#index'

  resources :spots, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :spots, only: [:update]
    end
  end

end
