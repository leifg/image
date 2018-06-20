class ImagesController < ApplicationController
  before_action :set_image, only: [:show]

  # GET /images/1
  # GET /images/1.json
  def show
  end

  def create
    puts params.inspect

    @image = Image.new(id: 2711, content_type: "image/jpeg", filename: "portrait.jpg", filesize: 82844)
    render :show, json: @image
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.fetch(:image, {})
    end
end
