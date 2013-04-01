module OrdersHelper

  def clear_order_and_cart
    session[:order_params] = nil
    session[:cart] = nil
  end

  def type_of_delivery(order)
    if order.no_delivery?
      'collection in person'
    else
      #order.free_delivery_with_distance?
      'free delivery!'
    end
    # else
    #   "delivery cost: #{Order::DELIVERY_COST}"
    # end
  end

end
