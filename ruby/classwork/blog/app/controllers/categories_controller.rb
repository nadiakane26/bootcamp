class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
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
      
      redirect_to @category
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to @category, status: :see_other
  end
q
  private
  def category_params
    params.expect(category: [:name, :description, :image])
  end
end
 