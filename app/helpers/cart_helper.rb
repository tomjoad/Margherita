module CartHelper

  def find_cart
    @cart ||= Cart.new(session[:cart])
  end

  def there_is_something_in_cart?
    !session[:cart].try(:empty?).nil? && !session[:cart].try(:empty?)
  end

  def there_are_instances?(cart, line_items)
    !(cart.nil? || line_items.nil?)
  end

  def cart_price
    Cart.new(session[:cart]).price
  end

  def line_items_count
    LineItem.all(session[:cart]).count
  end

end
