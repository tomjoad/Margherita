class OrdersController < ApplicationController
  include CartHelper

  def new
    @cart = find_cart
    @line_items = LineItem.all(session[:cart])
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    flash[:notice] = "Your order is pending" if @order.save
    redirect_to root_url
  end

end
