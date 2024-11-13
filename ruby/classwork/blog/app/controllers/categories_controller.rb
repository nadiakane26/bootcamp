class CategoriesController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show] # "Signed-in"

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(title: "...", body: "...")

    if @category.save
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(article_params)
      redirect_to @category
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def category_params
    params.expect(category: [:name, :description])
  end
end
 