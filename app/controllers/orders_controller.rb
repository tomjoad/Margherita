class OrdersController < ApplicationController
  before_filter :signed_in_user

  include CartHelper
  include SessionsHelper

  def new
    @cart = find_cart
    @line_items = LineItem.all(session[:cart])
    @order = Order.new
    @user = current_user
  end

  def create
    @order = Order.new(params[:order])
    @order.cart = session[:cart]
    flash[:notice] = "Your order is pending" if @order.save
    redirect_to root_url
  end

end
