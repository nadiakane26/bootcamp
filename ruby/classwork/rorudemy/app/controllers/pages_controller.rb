class PagesController < ApplicationController
  def index
    @articles = Article.last(3)
  end

  def contact
  end

  def about
  end
end
