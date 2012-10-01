class OrdersController < ApplicationController
  respond_to :html
  before_filter :signed_in_user

  include CartHelper
  include SessionsHelper

  def index
    if params[:history]
      @orders = current_user.orders.for_user_history
    else
      @orders = current_user.orders.for_user_account
    end
  end

  def new
    @cart = find_cart
    @line_items = LineItem.all(session[:cart])
    # if params[:order]
    #   @order = Order.new(params[:order])
    # else
      @order = Order.new
    # end
    @user = current_user
  end

  def create
    if params[:recal]
      flash[:notice] = "gowno"
    else
      @order = Order.new(params[:order])
      @order.cart = session[:cart]
      flash[:notice] = "Your order is pedning" if @order.save
      redirect_to root_url
    end
  end

  # def recalculate
  #   @order = Order.new(params[:order])
  #   @order.calculate_delivery_cost
  #   redirect_to new_order_path(@order)
  # end
end
