class ImagesController < ApplicationController
  before_action :load_image_service

  def create
    upload_params = params["image"]
    @image = @image_service.store_image(upload_params.to_io.path, upload_params.original_filename, upload_params.content_type)
    render :show, json: @image
  end

  def show
    image_id, _ = params["id"].split(".")
    @image = @image_service.fetch_image(image_id.to_i)
    send_data @image.data, type: "image/jpeg", disposition: "inline"
  end

  private
    def load_image_service(service = ImageService.new)
      @image_service ||= service
    end
end
