class SightingsController < ApplicationController
  before_action :set_sighting
  def index
    if params[:sighting].present?
      @sightings = Sighting.ransack(place_or_detail_matches: "%#{params[:sighting][:keyword]}%").result
    end
  end

  def new
  end

  def create
    @sighting = Sighting.new(sighting_params)
    if @sighting.save
      redirect_to sightings_path
    else
      render :new
    end
  end

  private

  def sighting_params
    params.require(:sighting).permit(:detail, :image, :place, :date, :address, :latitude, :longitude).merge(user_id: current_user.id)
  end

  def set_sighting
  end
end
