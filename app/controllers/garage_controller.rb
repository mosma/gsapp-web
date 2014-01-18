class GarageController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update, :like, :unlike]
  before_action :set_garage, only: [:show, :tags, :like, :unlike]

  def index
  end

  def show
    @products = @garage.products
    respond_to do |format|
      format.html do
        impressionist(@garage)
      end
      format.json { render inline: '{}' }
    end
  end

  def edit
  end

  def update
  end

  def like
    @garage.liked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render inline: '{}'  }
    end
  end

  def unlike
    @garage.unliked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render inline: '{}'  }
    end
  end

  def tags
    tags = Product.where(garage: @garage).pluck(:tags).flatten.uniq
    tags = tags.select do |item| 
      item =~ /^#{params[:q]}/  
    end unless params[:q].blank?
    render inline: tags.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garage
      @garage = Garage.friendly.find params[:name]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def garage_params
      params.require(:garage).permit(:name)
    end
end
