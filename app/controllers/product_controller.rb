class ProductController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update]
  before_action :set_product, only: [:show]

  def index
  end

  def new
    @product = my_garage.products.build
  end

  def create
    
  end

  def show
  end

  def edit
  end

  def update
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find params[:product]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name)
    end
end
