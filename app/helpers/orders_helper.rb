module OrdersHelper

  def clear_order_and_cart
    session[:order_params] = nil
    session[:cart] = nil
  end

  def type_of_delivery(order)
    if order.no_delivery?
      'collection in person'
    elsif order.free_delivery_with_distance?
      'free!'
    else
      "delivery cost: #{order.delivery_cost}"
    end
  end

end
