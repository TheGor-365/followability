class UsersController < ApplicationController
  before_action :set_user, only: %i[show block]
  before_action :authenticate_user!, except: [:show]

  def index
    # @users = User.all.where.not(id: current_user.id)
    @users = User.excluding(current_user)
  end

  def show
    @posts = if @user.blocked?(current_user) || @user.blocked_by?(current_user)
       []
     else
       @user.posts
     end
  end

  def block
    @user = User.find(params[:id])
    current_user.blocked?(@user) ? current_user.unblock(@user) : current_user.block(@user)
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
