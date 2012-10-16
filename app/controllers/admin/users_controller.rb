class Admin::UsersController < ApplicationController
  before_filter :user_should_be_admin

  include AuthHelper

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if User.update_all(params[:user], {:id => @user.id})
      flash[:notice] = "updated"
      redirect_to admin_users_path
    else
      flash[:notice] = "didn`t work"
      redirect_to admin_users_path
    end
  end
  # private

  # def user_should_be_admin
  #   unless current_user.role.admin?
  #     redirect_to root_url, notice: "No permission."
  #   end
  # end
end
