class ImagesController < ApplicationController
  before_action :set_image, only: [:show]
  before_action :load_image_service

  def create
    upload_params = params["image"]
    @image = @image_service.store_image(upload_params.to_io.path, upload_params.original_filename, upload_params.content_type)
    render :show, json: @image
  end

  def load_image_service(service = nil)
    @image_service ||= service
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.fetch(:image, {})
    end
end
