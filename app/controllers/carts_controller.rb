class CartsController < ApplicationController
  include CartHelper

  def new
    @cart = find_cart
    @line_items = LineItem.all(session[:cart])
  end

  def destroy
    session[:cart] = nil
    redirect_to products_path(:id => "pizza")
  end

end
