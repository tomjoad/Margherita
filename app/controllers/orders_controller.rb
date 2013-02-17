# -*- coding: utf-8 -*-
class OrdersController < ApplicationController
  respond_to :html
  before_filter :signed_in_user

  include CartHelper
  include SessionsHelper
  include ApplicationHelper

  # doesn`t matter who is the seller
  # if parameter history is 'true', finished and cancelled orders
  # will be displayed, in other case only pending orders.

  def index
    if user_is_admin_or_seller?
      @orders = Order.for_seller(params[:filter])
    else
      @orders = Order.for_customer(current_user, params[:history])
    end
  end

  def new
    session[:order_params] ||= {}
    @cart = find_cart
    @line_items = LineItem.all(session[:cart])
    @order = Order.new(session[:order_params])
    @user = current_user
    # session[:checkout] = nil
  end

  def create
    session[:order_params] = params[:order]
    @order = Order.new(params[:order])
    @order.cart = session[:cart]
    # if @order.valid?
    if session[:checkout]
      if @order.save
        session[:checkout] = nil
        flash[:notice] = 'Your order is pending'
        redirect_to orders_path(:filter => @order.state)
      end

    else
      session[:checkout] = true
      redirect_to new_order_path
    end
    #else
    #   redirect_to 'new'
    # end
  end

  # actions for state machine, wrap to the model as much as possible
  # standard order updating, details should be considered in the future

  def update
    if params[:operation]
      @order = Order.find(params[:id])
      @order.send params[:operation].to_sym
    end
    redirect_to orders_path(:filter => @order.state)
  end

end
