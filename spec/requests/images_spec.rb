require "rails_helper"

RSpec.describe "Images", type: :request do
  describe "POST /images" do
    let(:fixture) do
      file_fixture("images/portrait.jpg")
    end

    let(:content_type) do
      "image/jpeg"
    end

    it "returns 200 OK" do
      post images_path, params: { image: fixture_file_upload(fixture.to_path, content_type) }
      expect(response).to have_http_status(200)
    end

    it "writes to database" do
      expect {
        post images_path, params: { image: fixture_file_upload(fixture.to_path, content_type) }
      }.to change { Image.count }.by(1)
    end
  end

  describe "GET /images/:id.jpg" do
    let!(:image) do
      fixture = file_fixture("images/portrait.jpg")
      img = Image.new(
        filename: fixture.basename.to_s,
        data: fixture.read,
        content_type: "image/jpeg",
        filesize: fixture.size,
      )
      img.save!
      img
    end

    it "returns 200 OK" do
      get image_path("#{image.id}.jpg")
      expect(response).to have_http_status(200)
    end

    it "returns image/jpeg content type" do
      get image_path("#{image.id}.jpg")
      expect(response.content_type).to eq("image/jpeg")
    end

    it "returns non empty body" do
      get image_path("#{image.id}.jpg")
      expect(response.body).not_to be(nil)
    end
  end
end
