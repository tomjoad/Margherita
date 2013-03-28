class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user, only: [:edit, :update, :show]

  include SessionsHelper

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes_with_password_control(params[:user])
      flash[:notice] = "You have changed your profile details!"
      render "show"
    else
      render "edit"
    end
  end

  def create
    # registration
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Margherita! Complete your profile details to order faster every time you visit!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def correct_user
    # ?
    @user = User.find(params[:id])
    redirect_to root_url, notice: "Wrong user" unless current_user?(@user)
  end
end
