class PagesController < ApplicationController
  def index
    @articles = Article.all # or any other query that retrieves articles
  end

  def contact
  end

  def about
  end
end
