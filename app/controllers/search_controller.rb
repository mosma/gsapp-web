class SearchController < ApplicationController
  def index

    #@garages = Garage.search params
    @products = Product.search params

  end

  def tags
  end

  def category
  end
end
