module CartHelper

  def find_cart
    @cart ||= Cart.new(session[:cart])
  end

end
