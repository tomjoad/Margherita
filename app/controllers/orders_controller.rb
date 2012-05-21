class OrdersController < ApplicationController
  include CartHelper

  def new
    @cart = find_cart
    @line_items = LineItem.all(session[:cart])
    @order = Order.new
  end

  def create
  end

end
