# This block begins the definition of all your routes in the application. 
# It’s a method call that tells Rails to set up routing rules.
Rails.application.routes.draw do
  root "articles#index"
  # A route that responds to HTTP GET requests made to the URL /articles
  # The request should be handled by the index action of the ArticlesController
  
  # The GET /articles request (typically a request to show a list of articles) will be routed to the index action in the ArticlesController.
  # Index Action: Gather the necessary data (like all articles in the database) and pass it to the view, which will then display it to the user.
  
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"

  # replaced the two get routes
  resources :articles

  # This creates comments as a nested resource within articles. 
  # hierarchical relationship that exists between articles and comments.
  resources :articles do
    resources :comments
  end 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
