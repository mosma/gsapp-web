module ProductHelper
  def show_value product
    value = Money.new(product.value*100, product.currency)
    "#{value.symbol} #{value}"
  end
end
