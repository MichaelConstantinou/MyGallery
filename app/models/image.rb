class Image < ApplicationRecord
  belongs_to :gallery

  mount_uploader :url, ImageUploader
end
