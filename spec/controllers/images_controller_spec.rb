require 'rails_helper'

RSpec.describe ImagesController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
      it "returns" do
        expect {
          post :create, params: {image: valid_attributes}, session: valid_session
        }.to change(Image, :count).by(1)
      end

      it "renders a JSON response with the new image" do
        post :create, params: {image: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(image_url(Image.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new image" do

        post :create, params: {image: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
