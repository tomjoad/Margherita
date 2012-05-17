class CartsController < ApplicationController
  include CartHelper

  def new
    @cart = find_cart
    # @line_items = LineItem.all(session[:cart])
  end

  # def add_to
  #    @cart = find_cart
  #    @cart.add_item(params[:product][:name])
  #    flash[:notice] = params[:name]
  #   redirect_to cart_new_path
  # end

  def destroy
    session[:cart] = nil
    redirect_to new_carts_path
  end

end
