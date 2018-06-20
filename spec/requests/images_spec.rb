require 'rails_helper'

RSpec.describe "Images", type: :request do
  describe "GET /images" do
    xit "works! (now write some real specs)" do
      get image_path(1)
      expect(response).to have_http_status(200)
    end
  end
end
