module CartHelper

  def find_cart
    @cart ||= Cart.new(session[:cart])
  end

  def there_is_something_in_cart?
    !session[:cart].try(:empty?).nil? && !session[:cart].try(:empty?)
  end

end
