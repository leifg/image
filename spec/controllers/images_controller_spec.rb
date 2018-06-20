require 'rails_helper'

RSpec.describe ImagesController, type: :controller do

  let(:image_id) do
    2711
  end

  describe "POST #create" do
    context "with valid params" do
      before do
        file_path = file_fixture('images/portrait.jpg').to_path

        request.headers.merge!({'ACCEPT' => 'application/json'})
        post :create, params: {image: fixture_file_upload(file_path, 'image/jpeg')}
      end

      it "returns JSON response with 200 OK" do
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
