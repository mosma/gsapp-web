module ProductHelper
  def is_my_product? product
    product.garage == my_garage
  end
  def show_value product
    value = Money.new(product.value*100, product.currency)
    "#{value.symbol} #{value}"
  end
end
