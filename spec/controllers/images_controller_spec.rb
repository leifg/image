require 'rails_helper'

RSpec.describe ImagesController, type: :controller do

  let(:fixture) do
    file_fixture('images/portrait.jpg')
  end

  let(:image_id) do
    2711
  end

  let(:content_type) do
    'image/jpeg'
  end

  let(:filename) do
    fixture.basename.to_s
  end

  let(:filesize) do
    fixture.size
  end

  describe "POST #create" do
    context "with valid params" do
      before do
        request.headers.merge!({'ACCEPT' => 'application/json'})
        post :create, params: {image: fixture_file_upload(fixture.to_path, content_type)}
      end

      it "returns JSON response with 200 OK" do
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end

      it "returns expected JSON response" do
        result = JSON.parse(response.body)
        expect(result["id"]).to eq(image_id)
        expect(result["content_type"]).to eq(content_type)
        expect(result["filename"]).to eq(filename)
        expect(result["filesize"]).to eq(filesize)
      end
    end
  end
end
