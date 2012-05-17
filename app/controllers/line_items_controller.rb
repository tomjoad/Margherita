class LineItemsController < ApplicationController

  # in model "all" method should return array like:
  # [[product_object, quantity, price],...] from session[:cart] which is
  # like [1, 1, 2, 2, 1, 23, 2], numbers are ids of products.
  def index
    @line_items = LineItem.all(session[:cart])
  end

  def update
    @product = Product.find(params[:id])
    if params[:operation] == 'add'
      session[:cart] << @product.id
    elsif params[:operation] == 'subtract'
      session[:cart].delete_at(session[:cart].find_index(@product.id))
    end
    redirect_to line_items_path
  end

  # def add
  #   # @product = Product.find(params[:id])
  # end

  # def subtract
  #   # @product = Product.find(params[:id])
  # end

  def destroy
    @product = Product.find(params[:id])
    session[:cart].delete(@product.id)
  end

end
