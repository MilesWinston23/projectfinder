class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @user_post = Post.where(user_id: params[:id])
  end
end