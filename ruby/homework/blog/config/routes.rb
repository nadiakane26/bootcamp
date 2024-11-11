Rails.application.routes.draw do
  devise_for :users
  
  # Define the routes for categories
  resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy]  
  
  # Root path points to categories index
  #root "categories#index"
  root "articles#index"

  # Routes for articles and their comments
  resources :categories do
    resources :articles do
      resources :comments
    end
  end

  # Health check route for your app
  get "up" => "rails/health#show", as: :rails_health_check

  # (Optional) Routes for PWA, if relevant
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
