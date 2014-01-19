module ProductHelper
  def is_my_product? product
    return nil if !user_signed_in?
    product.garage == my_garage
  end
  def show_value product
    value = Money.new(product.value*100, product.currency)
    "#{value.symbol} #{value}"
  end
  def list_currency currency=nil
    [ 
      [ Money.new(0,'EUR').symbol, 'EUR'],
      [ Money.new(0,'USD').symbol, 'USD'],
      [ Money.new(0,'BRL').symbol, 'BRL']
    ]
  end
end
