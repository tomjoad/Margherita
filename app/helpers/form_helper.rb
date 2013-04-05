module FormHelper

  def setup_for(product)
    # maximum variants number = 3
    (4 - product.variants.count).times { product.variants.build }
    product
  end

  def hide_address(order)
    if (order.distance == Order::NO_DISTANCE) || (order.distance.nil?)
      %&style="display: none;"&.html_safe
    end
  end
end

