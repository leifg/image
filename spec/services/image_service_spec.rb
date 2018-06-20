require 'rails_helper'

RSpec.describe ImageService do
  describe "store_image" do
    let(:fixture) do
      file_fixture('images/portrait.jpg')
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

    let(:filepath) do
      fixture.to_s
    end

    it "stores a row in database" do
      expect {
        ImageService.new.store_image(filepath, filename, content_type)
      }.to change{Image.count}.by(1)
    end

    it "returns expected image" do
      image = ImageService.new.store_image(filepath, filename, content_type)
      expect(image.id).not_to be_nil
      expect(image.filename).to eq(filename)
      expect(image.data).not_to be_nil()
      expect(image.content_type).to eq(content_type)
      expect(image.filesize).to eq(filesize)
    end
  end
end
