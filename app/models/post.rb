class Post < ApplicationRecord
  # has_one_attached :image
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :name, presence: true
  validates :lost_place, presence: true
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  after_validation :reverse_geocode, if: ->(obj){ obj.latitude.present? and obj.latitude_changed? }
end
