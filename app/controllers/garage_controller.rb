class GarageController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update, :like, :unlike]
  before_action :set_garage, only: [:show, :edit, :update, :tags, :like, :unlike, 
    :localization, :update_localization, :statistics]

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
    garage = garage_params
    garage[:tags] = garage[:tags].split(',')
    respond_to do |format|
      if @garage.update_attributes(garage)
        if @garage.slug.empty?
          @garage.slug = nil
          @garage.save
        end
        format.html { redirect_to profile_path(my_garage), notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @garage }
      else
        format.html { render action: 'edit' }
        format.json { render json: @garage.errors, status: :unprocessable_entity }
      end
    end
  end


  def localization
  end

  def update_localization
    garage = garage_params
    respond_to do |format|
      if @garage.update_attributes(garage)
        if @garage.slug.empty?
          @garage.slug = nil
          @garage.save
        end
        format.html { redirect_to localization_path(my_garage), notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @garage }
      else
        format.html { render action: 'edit' }
        format.json { render json: @garage.errors, status: :unprocessable_entity }
      end
    end
  end

  def statistics
    
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
      params.require(:garage).permit(:name,:name, :slug, :description, :link, :tags, :status, :avatar, :latitude, :longitude, :street, :city, :state, :country)
    end
end
