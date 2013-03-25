module FormHelper

  def setup_for(product)
    # maximum variants number = 3
    (3 - product.variants.count).times { product.variants.build }
    product
  end

end

