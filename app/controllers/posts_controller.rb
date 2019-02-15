class PostsController < ApplicationController
  def index
    @post = Post.find(1)
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :name, :lost_plase, :lost_date, :address, :detail).merge(user_id: current_user.id)
  end
end
