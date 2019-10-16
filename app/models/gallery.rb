class Gallery < ApplicationRecord
    belongs_to :user
    has_many :images, dependent: :destroy

    mount_uploader :cover_image, ImageUploader
end
