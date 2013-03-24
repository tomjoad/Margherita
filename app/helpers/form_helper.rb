module FormHelper

  def setup_for(product)
    (3 - product.variants.count).times { product.variants.build }
    product
  end
end

