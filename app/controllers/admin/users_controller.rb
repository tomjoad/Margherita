class Admin::UsersController < ApplicationController
  before_filter :user_should_be_admin

  def index
    @users = User.all
  end

  private

  def user_should_be_admin
    unless user_is_admin
      redirect_to root_url, notice: "No permission."
    end
  end


end
