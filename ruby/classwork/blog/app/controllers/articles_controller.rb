class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    
    respond_to do |format|
      format.html # Regular HTML request
      format.js   # JavaScript request (for AJAX)
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @article.errors, status: :unprocessable_entity }
        
      end
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update(article_params)
      format.html { redirect_to @article, notice: "Article was successfully updated." }
      format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @article.errors, status: :unprocessable_entity }
      end
  end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to @article, status: :see_other
  end



  private
    def article_params
      params.expect(article: [:title, :body, :category_id, :author_id])
    end
end
