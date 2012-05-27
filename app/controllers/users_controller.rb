class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "You have changed your user info!"
      sign_in @user
      redirect_to root_url
    else
      render :action => "edit"
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Margherita! Now you can edit your shipping info in \"Account\" menu."
      redirect_to @user
    else
      render 'new'
    end
  end
end
