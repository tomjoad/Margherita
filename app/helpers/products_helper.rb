module ProductsHelper
  def test
    "Yo!"
  end

  # if for example, there are only 2 variants of product, let`s take
  # small, and big only, no medium size, it is making correct array
  # like: [variant_small, nill, variant_big]

  def display_in_order(variants)
    arr = [nil, nil, nil]

    variants.each do |variant|
      if variant.size == 'small'
        arr[0] = variant
      elsif variant.size == 'medium'
        arr[1] = variant
      elsif variant.size == 'big'
        arr[2] = variant
      end
    end

    return arr
  end

end
