class ImagesController < ApplicationController
    def create
        @image = Image.new(image_params)
        binding.pry
        @image.save
    end

    private

    def image_params
        params.requre(:image).permit[:url]
    end
end

