class PostsController < ApplicationController
  def index
    @posts = Post.all.page(params[:page]).per(PER_PAGE)
  end
  def new
    @post = Post.new
  end
  def create
    @post =  Post.new(post_params)
    if @post.save
      flash[:notice] = I18n.t('posts.new.messages.success')
      redirect_to @post
    else
      flash[:alert] = translate_errors(@post.errors)
      render 'new'
    end
  end
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.page(params[:page]).per(PER_PAGE)
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = I18n.t('posts.edit.messages.success')
      redirect_to @post
    else
      flash[:alert] = translate_errors(@post.errors)
      render 'edit'
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path

  end
  private
   def post_params
    params.require(:post).permit(:text, :title )
   end
end
