class ImageService
  def store_image(path, filename, content_type)
    file_content = File.read(path)
    image = Image.new(
      filename: filename,
      content_type: content_type,
      data: file_content,
      filesize: file_content.bytesize
    )
    image.save!
    image
  end

  def fetch_image(image_id)
    Image.find(image_id)
  end
end
