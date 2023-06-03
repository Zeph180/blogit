class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])

    @comment = @post.comments.new(comment_params)
    @comment.author = @user
    if @comment.save
      flash[:success] = 'Comment was successfully created.'
    else
      flash[:error] = 'Comment was not created.'
    end
    redirect_to user_post_path(@user, @post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
