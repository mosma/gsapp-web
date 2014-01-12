class HomeController < ApplicationController
  def index
    @category = Category.root
    @garages = Garage.all
    @products = Product.all
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
