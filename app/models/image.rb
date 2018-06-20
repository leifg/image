class Image < ApplicationRecord
  def as_json(options = {})
    super(only: [:id, :content_type, :filename, :filesize])
  end
end
