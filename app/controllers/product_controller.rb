class ProductController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show]

  def index
  end

  def new
    @product = my_garage.products.build
  end

  def create
    @product = my_garage.products.build(product_params)
    @product.slug = nil if @product.slug.empty?
    
    respond_to do |format|
      if @product.save
        format.html { redirect_to product_path(my_garage, @product), notice: 'Report was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @garage = @product.garage
    @products = @garage.products
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
      params.require(:product).permit(:name, :slug, :currency, :value, :tags, :description)
    end
end
