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
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category was successfully created."
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
    end
    @category.image.attach(params[:images])
  end
  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:notice] = "Category was successfully updated."
      redirect_to @category
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, status: :see_other
  end

  private
  def category_params
    params.expect(category: [:name, :description, :image])
  end
end
 