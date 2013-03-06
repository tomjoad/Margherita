class LineItemsController < ApplicationController
  include ApplicationHelper
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
    @variant = Variant.find(params[:id])
    session[:cart] = @cart.items
    if params[:menu]
      respond_to do |format|
        format.html { redirect_to products_path }
        # (:id => @variant.format_category_name)}
        format.js
      end
    else
      redirect_to new_cart_path
    end
  end

  def destroy
    @cart = find_cart
    @cart.items.delete(params[:id])
    session[:cart] = @cart.items
    if params[:cart] == "small"
      redirect_to products_path(:id => "pizza")
    else
      redirect_to new_cart_path
    end
  end

  # private

  #  def require_cart_not_empty
  #    unless there_is_something_in_cart?
  #      redirect_to root_url
  #    end
  #  end

end
