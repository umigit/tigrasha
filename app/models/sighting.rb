class Sighting < ApplicationRecord
  has_one_attached :image

  validates :place, presence: true;
end
