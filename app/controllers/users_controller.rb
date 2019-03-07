class UsersController < ApplicationController
  def show
    user = User.find(current_user.id)
  end

  def sightings
    user = User.find(current_user.id)
    @sightings = user.sightings

    render @sightings
  end

  def posts
    user = User.find(current_user.id)
    @posts = user.posts

    render @posts
  end

  def new
  end

  def destroy
    redirect_to root_path
  end
end
