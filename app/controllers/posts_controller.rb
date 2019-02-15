class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :name, :lost_place, :lost_date, :address, :detail).merge(user_id: current_user.id)
  end
end
