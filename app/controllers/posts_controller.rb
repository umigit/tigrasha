class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create]

  def index
    @posts = Post.includes(:user)
  end

  def show
    @sightings = Sighting.near([@post.latitude, @post.longitude], 5)

    respond_to do |format|
      format.html
      format.js
      format.json {render json: @sightings}
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
        format.js {render json: @post}
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      respond_to do |format|
        format.js {render json: @post}
      end
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :name, :lost_place, :lost_date, :address, :latitude, :longitude, :detail).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
