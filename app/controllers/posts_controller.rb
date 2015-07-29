class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:sucess] = 'Post successfully created'
      redirect_to @post
    else
      flash[:alert] = 'Halt, you fiend! You need an image to post here!'
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    flash[:success] = 'Post successfully updated'
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
