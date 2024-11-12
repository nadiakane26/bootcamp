Rails.application.routes.draw do
  root "category#index"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Categories resource, not nested under anything
  resources :categories

  # Comments are nested under articles
  resources :articles do
    resources :comments
  end
end 
