class LineItemsController < ApplicationController
  include CartHelper
  # in model "all" method should return array like:
  # [[product_object, quantity, price],...] from session[:cart] which is
  # like ["1", "1", "2", "2", "1", "23", "2"], numbers are ids of products.
  def index
    @cart = find_cart
    @line_items = LineItem.all(session[:cart])
  end

  def update
    @cart = find_cart
    @cart.update_line_item(params[:operation], params[:id])
    session[:cart] = @cart.items
    redirect_to line_items_path
  end

  # def add
  #   # @product = Product.find(params[:id])
  # end

  # def subtract
  #   # @product = Product.find(params[:id])
  # end

  def destroy
    @cart = find_cart
    @cart.items.delete(params[:id])
    session[:cart] = @cart.items
    redirect_to line_items_path
  end

end
