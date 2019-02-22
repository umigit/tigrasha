class Sighting < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  validates :place, presence: true
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  after_validation :reverse_geocode
end
