class CommentsController < ApplicationController
  def create
    @post = Post.find(params["post_id"])
    @comment = @post.comments.create(params_comment)
    redirect_to post_path(@post)
  end
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  private
    def params_comment
      params.require(:comment).permit(:commenter, :body)
    end
end
