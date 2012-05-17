class Cart

  attr_accessor :items
  # , :total_price

  def initialize(items)
    # raise ArgumentError, "value should be hash of items" unless items.class == Hash
    # in session hash of items like:
    # { "Frytki" => 1, "Hot-dog" => 1, "Ciabatta" => 2}
    # second attempt: Session could look like this also:
    # [1, 2, 1, 1, 32, 2, 2] Array consists of products id`s which can duplicate.
    # logic in model will shape it.
    if items.nil?
      @items = [ ]
    else
      @items = items
    end
    # @price = cart_total_price
  end

  def update_line_item(operation, product_id)
    if operation == "add"
      @items << product_id
    elsif operation == "subtract"
      if @items.include?(product_id)
        @items.delete_at(@items.find_index(product_id))
        # what to do if items don`t include item i want to subtracti
      end
    else
      # do more
    end
  end

  def price
    x = 0
    LineItem.all(@items).each { |element| x += element.total_price }
    x
  end

  # def add_item(product_name)
  #   if @items.keys.include? product_name
  #     @items[product_name] += 1
  #   else
  #     @items[product_name] = 1
  #   end
  # end

  # def delete_item(product_name)
  #   check_item_existence(product_name)
  #   @items[product_name] -= 1
  #   check_zero_values
  # end

  private

    # def check_item_existence(name)
    #   raise ArgumentError, "there are no such thing as #{name} in cart" unless @items.keys.include? name
    # end

    # def check_zero_values
    #   @items.delete_if { |key, value| value <= 0 }
    # end


end
