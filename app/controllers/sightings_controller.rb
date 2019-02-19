class SightingsController < ApplicationController
  def new
    @sighting = Sighting.new
  end

  private

  def set_sighting
  end
end
