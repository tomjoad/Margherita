module FormHelper
  # def setup_for(product)
  #   3.times {product.variants.build}
  #   product
  # end

  def setup_for(product)
    Product::SIZES.each do |size|
      product.variants.build(:size => size)
    end
    product
  end

end
