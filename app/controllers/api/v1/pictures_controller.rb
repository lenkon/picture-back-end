class Api::V1::PicturesController < ApplicationController
  before_action :set_picture, only: %i[show image_url]

  def index
    @pictures = Picture.all
    # render json: @pictures
    render json: @pictures.map { |picture| picture.as_json.merge(picture_url: picture.picture_url) }
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save 
      render json: @picture, status: :created     
    else
      render json: @picture.errors, status: :unprocessable_entity
    end
  end

  def image_url
    image_url = url_for(@picture.picture)
    render json: { image_url: }
  end

  def new
    # @picture = Picture.new
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end
  
  def picture_params
    # params.require(:picture).permit(:picture)
    params.permit(:picture) # Permit the :picture parameter
  end
end
