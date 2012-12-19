module ProductsHelper
  def test
    "Yo!"
  end

  # if for example, there are only 2 variants of product, let`s take
  # small, and big only, no medium size, it is making correct array
  # like: [variant_small, nill, variant_big] (just for displaying in
  # products index
  # variants -> variants of product options -> sizes
  # possibilities

  def display_in_order(variants, options)
    arr = Array.new(options.size)

    variants.each do |variant|
      if variant.size == options[0]
        arr[0] = variant
      elsif variant.size == options[1]
        arr[1] = variant
      elsif variant.size == options[2]
        arr[2] = variant
      end
    end

    return arr
  end

end
