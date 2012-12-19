module FormHelper

  def setup_for(product)
    # if product.variants.empty?
    (Product::SIZES - product.sizes).each do |size|
      product.variants.build(:size => size)
    end
    # else
    #   (Product::SIZES - product.sizes)
    # end
    product
    # end
  end
end

