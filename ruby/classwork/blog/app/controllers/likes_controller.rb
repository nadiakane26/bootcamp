class LikesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]

    def create
        @comment = Comment.find(params[:like][:comment_id])
        @like = current_user.likes.new(comment: @comment)
 
  
        if @like.save
          else
            flash[:alert] = @like.errors.full_messages.to_sentence
          end

      redirect_to @comment.article
        
    end
  
    def destroy
      @like = current_user.likes.find(params[:id])
      @comment = @like.comment
  
      # Destroy the like
      @like.destroy

    redirect_to @comment.article 
    end

    private
    def like_params
        params.expect(like: [:comment_id])
    end
end
