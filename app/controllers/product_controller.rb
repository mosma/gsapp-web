class ProductController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :like, :unlike]
  before_action :set_product, only: [:show, :edit, :update, :like, :unlike]

  def index
  end

  def new
    @product = my_garage.products.build
    @path = new_product_path(my_garage)
  end

  def create
    product = product_params
    product[:tags] = product[:tags].split(',')
    
    @path = new_product_path(my_garage)

    @product = my_garage.products.build(product)
    @product.slug = nil if @product.slug.empty?

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_path(my_garage, @product), notice: 'product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @statistics = @product.brief_statistic_data if is_my_product? @product
    @garage = @product.garage
    @products = @garage.products
    respond_to do |format|
      format.html do
        impressionist(@product)
      end
      format.json { render inline: '{}'  }
    end
  end

  def edit
    @path = update_product_path(my_garage, @product)
  end

  def update
    product = product_params
    product[:tags] = product[:tags].split(',')
    respond_to do |format|
      if @product.update_attributes(product)
        if @product.slug.empty?
          @product.slug = nil
          @product.save
        end
        format.html { redirect_to product_path(my_garage, @product), notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def like
    @product.liked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render inline: '{}'  }
    end
  end

  def unlike
    @product.unliked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render inline: '{}'  }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :slug, :currency, :value, :tags, :description, :status)
    end

    def impressions
      impressionist(@product)
    end
end
