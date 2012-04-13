class Product < ActiveRecord::Base

  def price_in_dolars
    return "#{@price} $"
  end

end
