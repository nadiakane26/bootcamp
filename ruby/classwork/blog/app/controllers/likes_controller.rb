class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:comment_id])
  
      # Create the like for the current user and the comment
      @like = current_user.likes.new(comment: @comment)
  
      if @like.save
        render json: { likes_count: @comment.likes.count, liked: true }, status: :ok
      else
        render json: { error: 'Unable to like comment' }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @like = current_user.likes.find(params[:id])
      @comment = @like.comment
  
      # Destroy the like
      @like.destroy
  
      render json: { likes_count: @comment.likes.count, liked: false }, status: :ok
    end

    private
    def like_params
        params.expect(like: [:comment_id])
    end
end
