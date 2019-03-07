class Sighting < ApplicationRecord
  # has_one_attached :image
  # has_many :images
  mount_uploader :image, ImageUploader
  belongs_to :user
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  validates :place, presence: true
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  after_validation :reverse_geocode, if: ->(obj){ obj.latitude.present? and obj.latitude_changed? }

  def image_filename
    self.image.filename.to_s if self.image.attached?
  end

  def image_url
    url_for(self.image) if self.image.attached?
  end
end
