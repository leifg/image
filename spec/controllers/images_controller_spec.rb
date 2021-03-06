require "rails_helper"

RSpec.describe ImagesController, type: :controller do

  before do
    controller.instance_variable_set(:@image_service, image_service)
  end

  after do
    controller.instance_variable_set(:@image_service, nil)
  end

  describe "POST #create" do
    let(:fixture) do
      file_fixture("images/portrait.jpg")
    end

    let(:image_id) do
      2711
    end

    let(:content_type) do
      "image/jpeg"
    end

    let(:filename) do
      fixture.basename.to_s
    end

    let(:filesize) do
      fixture.size
    end

    let(:expected_image) do
      Image.new(id: image_id, content_type: content_type, filename: filename, filesize: filesize)
    end

    let(:image_service) do
      spy("ImageService", store_image: expected_image)
    end

    before do
      request.headers.merge!("ACCEPT" => "application/json")
      post :create, params: { image: fixture_file_upload(fixture.to_path, content_type) }
    end

    context "with valid params" do
      it "returns JSON response with 200 OK" do
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq("application/json")
      end

      it "returns expected JSON response" do
        result = JSON.parse(response.body)

        expect(result["id"]).to eq(image_id)
        expect(result["content_type"]).to eq(content_type)
        expect(result["filename"]).to eq(filename)
        expect(result["filesize"]).to eq(filesize)

        expect(result.has_key?("data")).to be false
      end

      it "calls ImageService" do
        expect(image_service).to have_received(:store_image).with(a_string_ending_with(".jpg"), filename, content_type)
      end
    end
  end

  describe "GET #show" do
    let(:fixture) do
      file_fixture("images/portrait.jpg")
    end

    let(:image_id) do
      2711
    end

    let(:content_type) do
      "image/jpeg"
    end

    let(:filename) do
      fixture.basename.to_s
    end

    let(:filesize) do
      fixture.size
    end

    let(:expected_image) do
      Image.new(
        id: image_id,
        content_type: content_type,
        filename: filename,
        filesize: filesize,
        data: fixture.read,
      )
    end

    let(:image_service) do
      spy("ImageService", fetch_image: expected_image)
    end

    before do
      get :show, params: { id: "#{image_id}.jpg" }
    end

    it "returns jpg response with 200 OK" do
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq("image/jpeg")
    end

    it "returns body of image" do
      expect(response.body).to eq(fixture.read)
    end

    it "calls ImageService" do
      expect(image_service).to have_received(:fetch_image).with(image_id)
    end
  end
end
