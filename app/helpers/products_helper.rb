module ProductsHelper
  def test
    "Yo!"
  end

  # if for example, there are only 2 variants of product, let`s take
  # small, and big only, no medium size, it is making correct array
  # like: [variant_small, nil, variant_big] (just for displaying in
  # products index
  # variants -> variants of product options -> sizes
  # possibilities

  def display_in_order(variants)
    arr = []

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

  # string for product link name

  def combined_price_and_desc(variant)
    "#{variant.formatted_price}<br><small class='muted'>#{variant.size}</small>".html_safe
  end

end
