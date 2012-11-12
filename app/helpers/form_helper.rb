module FormHelper
  def setup_for(product)
    3.times {product.variants.build}
    product
  end
end
