class PostsController < ApplicationController
  before_action :set_post, only: %i(show edit update destroy)

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

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
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post successfully updated'
      redirect_to @post
    else
      flash[:success] = 'Something is wrong with your form'
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post successfully deleted'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
