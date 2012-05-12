class Cart

  attr_accessor :items

  def initialize(items)
    # raise ArgumentError, "value should be hash of items" unless items.class == Hash
    # in session hash of items like:
    # { "Frytki" => 1, "Hot-dog" => 1, "Ciabatta" => 2}
    if items.nil?
      @items = { }
    else
      @items = items
    end
  end

  def add_item(product_name)
    if @items.keys.include? product_name
      @items[product_name] += 1
    else
      @items[product_name] = 1
    end
  end

  def delete_item(product_name)
    check_item_existence(product_name)
    @items[product_name] -= 1
    check_zero_values
  end

  private

    def check_item_existence(name)
      raise ArgumentError, "there are no such thing as #{name} in cart" unless @items.keys.include? name
    end

    def check_zero_values
      @items.delete_if { |key, value| value <= 0 }
    end
end
