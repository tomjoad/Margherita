module OrdersHelper

  def clear_order_and_cart
    session[:order_params] = nil
    session[:cart] = nil
  end

end
