class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

    def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
      redirect_to article_path(@article)
    end
  
    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article), status: :see_other
    end

    def like
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      
      # Like/Unlike toggle 
      if current_user.liked?(@comment)
        current_user.unlike(@comment)
        liked = false
      else
        current_user.like(@comment)
        liked = true
      end
    
      # Respond with JSON to update the like button dynamically
      render json: { likes_count: @comment.likes.count, liked: liked }
    end

    private
      def comment_params
        params.expect(comment: [:commenter, :body])
      end
  end
  