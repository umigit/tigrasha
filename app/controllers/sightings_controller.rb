class SightingsController < ApplicationController
  def new
    @sighting = Sighting.new
  end

  def create
    @sighting = Sighting.new(sighting_params)
    @sighting.save
  end

  private

  def sighting_params
    params.require(:sighting).permit(:plece, :date, :image).merge(user_id: current_user.id)
  end

  def set_sighting
  end
end
