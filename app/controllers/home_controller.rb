class HomeController < ApplicationController
  def index
    @category = Category.root
    @garages = Garage.order('products_count DESC NULLS LAST').limit(30)
    @products = Product.limit(8)
  end

  def about
  end

  def terms
  end

  def faq
  end

  def contact
  end
end
