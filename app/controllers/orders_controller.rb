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
    @order = Order.new
    @user = current_user
  end

  def create
    @order = Order.new(params[:order])
    @order.cart = session[:cart]
    flash[:notice] = "Your order is pedning" if @order.save
    redirect_to root_url

    # errros should display

    # if @order.save
    #   flash[:notice] = "Your order is pending"
    #   redirect_to root_url
    # else
    #   respond_with(@order, :location => new_order_path)
    # end
  end

end
