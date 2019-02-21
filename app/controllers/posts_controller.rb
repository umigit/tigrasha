class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create]

  def index
    @posts = Post.includes(:user)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :name, :lost_place, :lost_date, :address, :location, :detail).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
