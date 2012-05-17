class LineItem

  attr_accessor :total_price, :product, :quantity

  def initialize(product_id, quantity)
    @product = Product.find_by_id(product_id)
    @quantity = quantity
    @total_price = count_total_price
  end

  def count_total_price
    @product.price * @quantity
  end

  def self.all(session_cart)
    if session_cart.nil?
      return [ ]
    else
      main = [ ]
      session_cart.uniq.each do |element|
        main << LineItem.new(Product.find_by_id(element), session_cart.count(element))
      end
      main
    end
  end

end
