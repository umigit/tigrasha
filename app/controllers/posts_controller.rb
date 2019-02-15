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
  end
end
