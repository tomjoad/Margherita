class OrdersController < ApplicationController
  respond_to :html
  before_filter :signed_in_user

  include CartHelper
  include SessionsHelper
  include ApplicationHelper

  def index
    @orders = Order.for_particular_users(current_user, params[:filter])
  end

  def new
    session[:order_params] ||= {}
    @cart = find_cart
    @order = Order.new
    @user = current_user
  end

  def checkout
    session[:order_params] = params[:order]
    @order = Order.new(params[:order])
    set_order_user_and_cart
    if @order.valid?
      redirect_to confirmation_orders_path
    else
      render :action => 'new'
    end
  end

  def confirmation
    @cart = find_cart
    @line_items = LineItem.all(session[:cart])
    @order = Order.fixed_new(session[:order_params], @cart)
  end

  def create
    @order = Order.new(params[:order])
    set_order_user_and_cart
    if @order.save
      clear_order_and_cart
      flash[:notice] = 'Your order is pending'
      redirect_to orders_path(:filter => @order.state)
    else
      redirect_to new_order_path
    end
  end

  def update
    if params[:operation]
      @order = Order.find(params[:id])
      @order.send params[:operation].to_sym
    end
    redirect_to orders_path(:filter => @order.state)
  end

  private

  def set_order_user_and_cart
    @order.cart = session[:cart]
    @order.user = current_user
    @user = current_user
  end

  def clear_order_and_cart
    session[:cart] = nil
    session[:order_params] = nil
  end

end
