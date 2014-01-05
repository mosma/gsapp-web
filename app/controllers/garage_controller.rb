class GarageController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update]
  before_action :set_garage, only: [:show]

  def index
  end

  def show
    @products = @garage.products
  end

  def edit
  end

  def update
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
