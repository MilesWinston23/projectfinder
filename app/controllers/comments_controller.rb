class CommentsController < ApplicationController
    before_action :find_commentable

    def new
      @comment = Comment.new
    end

    def create
      if user_signed_in?
      @comment = @commentable.comments.new comment_params
      @comment.user_id=current_user.id if current_user
      @comment.save
        redirect_to :back, notice: 'Your comment was successfully posted!'
      else
        redirect_to '/users/sign_in', notice: "Your comment wasn't posted! Please sign in!"
      end
    end
    
    def edit
        @comment = @commentable.comments.find(params[:id])
    end
    
    def update
        @comment = @commentable.comments.find(params[:id])
        
        if @comment.update(comment_params)
        redirect_to @commentable, notice: "Your comment was successfully updated"
        else
        render 'index'
        end
    end
    
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
    
      redirect_to :back
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
    end

end