class SightingsController < ApplicationController
  before_action :set_sighting

  def index
    if params[:sighting].present?
      @sightings = Sighting.ransack(place_or_detail_or_address_matches: "%#{params[:sighting][:keyword]}%").result

      render @sightings
    end
  end

  def show
    @sighting = Sighting.find(params[:id])
  end

  def new
  end

  def create
    @sighting = Sighting.new(sighting_params)
    if @sighting.save
      respond_to  do |format|
        format.js {render json: @sighting}
      end
    else
      render :new
    end
  end

  def upload
    @image = Image.new(image_params)
    @image.save
  end

  def destroy
    @sighting = Sighting.find(params[:id])
    @sighting.destroy

    respond_to do |format|
      format.html
      format.json {render json: @sighting, only: ["id"]}
      format.js {render json: @sighting, only: ["id"]}
    end
  end

  private

  def sighting_params
    params.require(:sighting).permit(:detail, :image, :place, :date, :address, :latitude, :longitude).merge(user_id: current_user.id)
  end

  def image_params
    params.requre(:image).permit[:url]
  end

  def set_sighting
  end
end
