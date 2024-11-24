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

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: "Category was successfully created." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @category.errors, status: :unprocessable_entity }
      end
      end
    @category.image.attach(params[:images])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update(category_params)
      format.html { redirect_to @category, notice: "Category was successfully updated." }
      format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @category.errors, status: :unprocessable_entity }
      end
  end
end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to @category, status: :see_other
  end

  private
  def category_params
    params.expect(category: [:name, :description, :image])
  end
end
 