class HomeController < ApplicationController
  def index
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
