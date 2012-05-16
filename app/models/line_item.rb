class LineItem

  attr_accessor :total_price, :product, :quantity

  def initialize(product_name, quantity)
    @product = Product.find_by_name(product_name)
    @quantity = quantity
    @total_price = count_total_price
  end

  def count_total_price
    @product.price * @quantity
  end

  def self.all(hash)
    if hash.nil?
      return [ ]
    else
      array_of_lineitems = [ ]
      hash.each do |key, value|
        array_of_lineitems << LineItem.new(key, value)
      end
      array_of_lineitems
    end
  end

end
