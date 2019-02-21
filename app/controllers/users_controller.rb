class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end

  def new
  end

  def destroy
    redirect_to root_path
  end
end
