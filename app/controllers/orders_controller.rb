class OrdersController < ApplicationController
  respond_to :html
  before_filter :signed_in_user

  include CartHelper
  include SessionsHelper
  include ApplicationHelper

  def index
    if user_is_admin_or_seller?
      # doesn`t matter who is the seller
      @orders = Order.for_seller(params[:filter])
    else
      # if parameter history is 'true', finished and cancelled orders
      # will be displayed, in other case only pending orders.
      @orders = Order.for_customer(current_user, params[:history])
    end
  end

  def new
    @cart = find_cart
    @line_items = LineItem.all(session[:cart])
    @order = Order.new
    @user = current_user
  end

  def create
    @order.cart = session[:cart]
    flash[:notice] = "Your order is pedning" if @order.save
    redirect_to root_url
  end

end
