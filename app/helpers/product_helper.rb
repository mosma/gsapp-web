module ProductHelper
  def is_my_product? product
    return nil if !user_signed_in?
    product.garage == my_garage
  end
  def show_value product
    value = Money.new(product.value*100, product.currency)
    "#{value.symbol} #{value}"
  end
end
