class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def category_params
    params.expect(category: [:name, :description])
  end
end
