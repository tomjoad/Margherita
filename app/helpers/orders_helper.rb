module OrdersHelper

  def clear_order_and_cart
    session[:order_params] = nil
    session[:cart] = nil
  end

  def type_of_delivery(order)
    if order.no_delivery?
      'collect on the spot'
    elsif order.free_delivery_with_distance?
      'order free delivery!'
    else
      "delivery cost: #{order.delivery_cost}"
    end
  end

end
