class Image < ApplicationRecord
    belongs_to :sighting
    mount_uploader :url, ImageUploader
end
