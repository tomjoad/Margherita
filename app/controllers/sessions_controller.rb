# -*- coding: utf-8 -*-
class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or(root_url)
    else
      flash[:error] = "Wrong email / password"
      redirect_to signin_path
    end
  end

  def destroy
    sign_out
    clear_sessions
    redirect_to root_url
  end

  private

  def clear_sessions
    session[:cart] = nil
    session[:order_params] = nil
  end
end
