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

  # Strange way to upgrade only one attribute.
  # Writing straight to db, overriding validations
  # and mass-assignment security.
  # Only for updating user roles.

  def update
    @user = User.find(params[:id])
    unless changing_his_own_role?(@user)
      User.update_all(params[:user], {:id => @user.id})
      #  if @user.update_attribute(:role, params[:user][:role])
      # if @user.send(:attributes=, {:role => params[:user][:role]})
      flash[:notice] = "User role updated!"
      redirect_to admin_users_path
      # else
      #   flash[:notice] = "didn`t work"
      #   redirect_to admin_users_path
      # end
    else
      flash[:notice] = "Can`t overwrite your own rights!"
      redirect_to admin_users_path
    end
  end

  private

  def changing_his_own_role?(user)
    current_user.id == user.id
  end

  # def user_should_be_admin
  #   unless current_user.role.admin?
  #     redirect_to root_url, notice: "No permission."
  #   end
  # end
end
