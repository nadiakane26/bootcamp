class PagesController < ApplicationController
  def home
    @categories = Category.all
    @recent_articles = Article.order(created_at: :desc).limit(5)
    @top_authors = Author.joins(:articles).group("authors.id").order("count(articles.id) DESC").limit(3)
  end
end
