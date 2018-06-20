class ImagesController < ApplicationController
  before_action :set_image, only: [:show]

  # GET /images/1
  # GET /images/1.json
  def show
  end

  def create
    puts params.inspect

    @image = {}
    render :show, json: @image
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.fetch(:image, {})
    end
end
