class Sighting < ApplicationRecord
  require "google/cloud/vision"
  # has_one_attached :image
  # has_many :images
  mount_uploader :image, ImageUploader
  belongs_to :user
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  validates :place, presence: true
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  after_validation :reverse_geocode, if: ->(obj){ obj.latitude.present? and obj.latitude_changed? }

  # def image_filename
  #   self.image.filename.to_s if self.image.attached?
  # end

  # def image_url
  #   url_for(self.image) if self.image.attached?
  # end

  def cat?
    labels = []
    labelText = ""
    project_id = "tigrasha"
    image_annotator = Google::Cloud::Vision::ImageAnnotator.new
    file_name = self.image.url
    response = image_annotator.label_detection image: file_name
    response.responses.each do |res|
      puts "Labels:"
      res.label_annotations.each do |label|
        puts label.description
        labels << label.description
        labelText += (label.description + ": " + label.score.to_s + "\n")
      end
      
      if labels.include?("Cat")
        labelText += "かわいいネコちゃんですね！"
      else
        labelText += "ネコじゃないよね？"
      end
    end

    return labelText
  end
end
