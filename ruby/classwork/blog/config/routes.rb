Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations' }
  resources :authors
  root "pages#home"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Categories resource, not nested under anything
  resources :categories

  # Comments are nested under articles
  resources :articles do
    resources :comments do
      member do
        put 'like'   # This route will handle liking a specific comment
      end
    end
  end

  resource :likes, only: [:create, :destroy]

  resources :donations, only: [:new, :create]
end 
