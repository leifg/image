require 'rails_helper'

RSpec.describe "Images", type: :request do
  describe "POST /images" do
    let(:fixture) do
      file_fixture('images/portrait.jpg')
    end

    let(:content_type) do
      "image/jpeg"
    end

    it "returns 200 OK" do
      post images_path, params: {image: fixture_file_upload(fixture.to_path, content_type)}
      expect(response).to have_http_status(200)
    end

    it "writes to database" do
      expect {
        post images_path, params: {image: fixture_file_upload(fixture.to_path, content_type)}
      }.to change{Image.count}.by(1)
    end
  end
end
