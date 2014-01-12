class SearchController < ApplicationController
  def index

    #@garages = Garage.search params
    @products = Product.search params
    respond_to do |format|
      format.html { 
        render :index, layout: false if !params[:no_layout].nil?
      } 
    end
  end

  def tags
  end

  def category
  end
end
