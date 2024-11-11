class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy] # Ensure only signed-in users can create categories
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = current_user.categories.find(params[:id])  # Ensure only the user's categories are editable
  end
  
  def update
    @category = current_user.categories.find(params[:id])  # Ensure only the user's categories are editable
  
    if @category.update(category_params)
      redirect_to @category, notice: "Category updated successfully."
    else
      render :edit
    end
  end

  def new
    @category = Category.new
  end

  def destroy
    @category = Category.find(params[:id])
    
    # Ensure the category belongs to the current user before allowing the delete
    if @category.user == current_user
      @category.destroy
      redirect_to categories_path, notice: 'Category deleted successfully.'
    else
      redirect_to categories_path, alert: 'You are not authorized to delete this category.'
    end
  end 

  def create
    @category = current_user.categories.build(category_params) # Associate the category with the current user

    if @category.save
      redirect_to categories_path, notice: "Category created successfully."
    else
      render :new
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
