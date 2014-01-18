class MediaController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_media, only: [:show, :edit, :update, :destroy]

  def index

    # @product = Product.find_by(id: params['product_id'])

    @medias = Media.where(product_id: params['product_id'])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medias.map{|media| media.to_jq_upload } }
    end
  end

  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @media }
    end
  end

  def new
    @media = Media.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @media }
    end
  end

  def edit
  end



  # POST /medias
  # POST /medias.json
  def create
    @media = Media.new(media_params)
    @media.user = current_user

    respond_to do |format|
      if @media.save
        format.html {
          render :json => [@media.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@media.to_jq_upload]}, status: :created, location: @media }
      else
        format.html { render action: "new" }
        format.json { render json: @media.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medias/1
  # PATCH/PUT /medias/1.json
  def update
    respond_to do |format|
      if @media.update_attributes(params[:media])
        format.html { redirect_to @media, notice: 'Media was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @media.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medias/1
  # DELETE /medias/1.json
  def destroy
    @media.destroy

    respond_to do |format|
      format.html { redirect_to medias_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media
      @media = Media.find(params[:id])
      @media.user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def media_params
      params.require(:media).permit(:image, :video, :new_product, :product_id, :status)
    end
end
