class LineItem

  attr_accessor :total_price, :product, :quantity, :variant

  def initialize(product, quantity, variant)
    @product = product
    @variant = Variant.find(variant)
    # @product = Product.find_by_id(product_id)
    @quantity = quantity
    @total_price = count_total_price
    # @total_price = count_total_price
  end

  def count_total_price
    @variant.price * @quantity
  end

  def size
    @variant.size
  end

  def self.all(session_cart)
    # now i have variant ID in cart
    if session_cart.nil?
      return [ ]
    else
      main = [ ]
      session_cart.uniq.each do |element|
        main << LineItem.new(Variant.find(element).product, session_cart.count(element), element)
        # main << LineItem.new(Product.find_by_id(element), session_cart.count(element))
      end
      main
    end
  end

end
