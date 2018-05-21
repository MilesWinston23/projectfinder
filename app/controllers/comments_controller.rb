class CommentsController < ApplicationController
    before_action :find_commentable


    def new
      @comment = Comment.new
    end
    
    def edit
    @comment = @commentable.comments.find(params[:id])
    end

    def create
      if user_signed_in?
      @comment = @commentable.comments.new comment_params
      @comment.user_id=current_user.id if current_user
      @comment.Username = current_user.Username if current_user
          @comment.save
        redirect_to :back, notice: 'Your comment was successfully posted!'
      else
        redirect_to '/users/sign_in', notice: "Your comment wasn't posted! Please sign in!"
      end
    end
    
   def update
     @comment = Comment.find(params[:id])
      if @comment.update_attributes(comment_params)
        redirect_to @comment.commentable, notice: "Comment was updated."
      else
        render :edit, notice: 'Your comment was not updated!'
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