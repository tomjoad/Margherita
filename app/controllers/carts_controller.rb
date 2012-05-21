class CartsController < ApplicationController
  include CartHelper

  def new
    @cart = find_cart
    @line_items = LineItem.all(session[:cart])
  end

  # def add_to
  #    @cart = find_cart
  #    @cart.add_item(params[:product][:name])
  #    flash[:notice] = params[:name]
  #   redirect_to cart_new_path
  # end

  # i`m not sure about it,
  # should it be DELETE or simple GET or what.

  def destroy
    session[:cart] = nil
    redirect_to line_items_path
  end

end
