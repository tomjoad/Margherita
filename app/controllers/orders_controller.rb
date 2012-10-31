class OrdersController < ApplicationController
  respond_to :html
  before_filter :signed_in_user

  include CartHelper
  include SessionsHelper
  include ApplicationHelper

  def index
    # need to be modified to current_user.seller? method
    if user_is_admin_or_seller?
      # doesn`t matter who is the seller
      @orders = Order.orders_for_seller(params[:filter])
      # @orders = Order.all
    else
      # if parameter history is 'true', finished and cancelled orders
      # will be displayed, in other case only pending orders.
      @orders = Order.orders_for_customer(current_user, params[:history])
    end
  end

  def new
    @cart = find_cart
    @line_items = LineItem.all(session[:cart])
    @order = Order.new
    @user = current_user
  end

  def create
    # if params[:recal]
    #   flash[:notice] = "gowno"
    # else
    @order = Order.new(params[:order])
    @order.cart = session[:cart]
    flash[:notice] = "Your order is pedning" if @order.save
    redirect_to root_url
    # end
  end

  # def recalculate
  #   @order = Order.new(params[:order])
  #   @order.calculate_delivery_cost
  #   redirect_to new_order_path(@order)
  # end
end
