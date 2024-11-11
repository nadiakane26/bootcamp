Rails.application.routes.draw do
  devise_for :users
  
  # Define the routes for categories
  resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy]  
  
  # Root path points to categories index
  root "categories#index"

  # Routes for articles and their comments
  resources :articles do
    resources :comments
  end

  # Health check route for your app
  get "up" => "rails/health#show", as: :rails_health_check

  # (Optional) Routes for PWA, if relevant
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
