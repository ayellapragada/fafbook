class Api::CommentsController < ApplicationController
  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.create(comments_params)
    @comment.notify :users, key: "commented on a post"

    @author = User.find(@post.author_id)
    @receiver = User.find(@post.receiver_id)

    render 'api/posts/show'
  end

  def update
  end

  def destroy
  end


  def comments_params
    params.require(:comment).permit(:comment, :user_id)
  end
end
