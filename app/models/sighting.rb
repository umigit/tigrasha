class Sighting < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :place, presence: true;
end
