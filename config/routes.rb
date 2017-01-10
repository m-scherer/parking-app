Rails.application.routes.draw do

  root 'home#index'

  resources :spots, only: [:index]
  resources :lots, only: [:new, :create, :edit, :update]

  namespace :api do
    namespace :v1 do
      resources :lots, only: [:create, :update, :destroy, :index, :show]
      resources :spots, only: [:create, :update, :destroy, :index, :show]
      namespace :taken do
        resources :spots, only: [:update]
      end
    end
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

end
